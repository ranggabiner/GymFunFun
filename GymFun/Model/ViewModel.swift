//
//  ViewModel.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI
import CreateMLComponents
import AsyncAlgorithms
import AudioToolbox

enum ExerciseType {
    case bicep
    case jumping
    case squat
    case finish
}

/// - Tag: ViewModel
class ViewModel: ObservableObject {

    /// The full-screen view that presents the pose on top of the video frames.
    @Published var liveCameraImageAndPoses: (image: CGImage, poses: [Pose])?
    
    @Published var showMenuScreen = false {
        didSet {
            if showMenuScreen {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.showOverlay = false
                        switch self.currentExercise {
                        case .bicep:
                            self.currentExercise = .jumping
                            self.uiCount = 0.0
                        case .jumping:
                            self.currentExercise = .squat
                            self.uiCount = 0.0
                        case .squat:
                            self.currentExercise = .finish
                            self.uiCount = 0.0
                        case .finish:
                            self.currentExercise = .bicep
                        }
                        self.showMenuScreen = false
                    }
                }
            }
        }
    }
    
    @Published var currentExercise: ExerciseType = .bicep
    
    static func preview() -> ViewModel {
            ViewModel()
        }

    /// The user-visible value of the repetition count.
    var uiCount: Float = 0.0
    
    var showOverlay:Bool = false
    
    var isDetected: Bool = false
    
    private var displayCameraTask: Task<Void, Error>?

    private var predictionTask: Task<Void, Error>?

    /// Stores the predicted action repetition count in the last window.
    private var lastCumulativeCount: Float = 0.0

    /// An asynchronous channel to divert the pose stream for another consumer.
    private let poseStream = AsyncChannel<TemporalFeature<[Pose]>>()
    
    /// A Create ML Components transformer to extract human body poses from a single image or a video frame.
    /// - Tag: poseExtractor
    private let poseExtractor = HumanBodyPoseExtractor()
    
    /// The camera configuration to define the basic camera position, pixel format, and resolution to use.
    private var configuration = VideoReader.CameraConfiguration()
    
    /// The counter to count action repetitions from a pose stream.
    private let actionCounter = ActionCounter()
    
    func resetExercises() {
        currentExercise = .bicep
        uiCount = 0.0
        showMenuScreen = false
        showOverlay = false
        // Reset any other relevant properties
    }

// MARK: - View Controller Events

    /// Configures the main view after it loads.
    /// Starts the video-processing pipeline.
    func initialize() {
        startVideoProcessingPipeline()
    }

// MARK: - Button Events

    /// Toggles the view between the front- and back-facing cameras.
    func onCameraButtonTapped() {
        toggleCameraSelection()

        // Reset the count.
        uiCount = 0.0

        // Restart the video processing.
        startVideoProcessingPipeline()
    }

// MARK: - Helper methods

    /// Change the camera toggle positions.
    func toggleCameraSelection() {
        if configuration.position == .front {
            configuration.position = .back
        } else {
            configuration.position = .front
        }
    }
    
    /// Start the video-processing pipeline by displaying the poses in the camera frames and
    /// starting the action repetition count prediction stream.
    func startVideoProcessingPipeline() {
        if displayCameraTask == nil && predictionTask == nil {
            if let displayCameraTask = displayCameraTask {
                displayCameraTask.cancel()
            }

            displayCameraTask = Task {
                // Display poses on top of each camera frame.
                try await self.displayPoseInCamera()
            }

            predictionTask = Task {
                // Predict the action repetition count.
                try await self.predictCount()
            }
        }
    }
    
    /// Stops the video processing pipeline by canceling the tasks.
    func stopVideoProcessingPipeline() {
        // Cancel the task responsible for displaying poses on camera frames.
        displayCameraTask?.cancel()
        // Cancel the task responsible for predicting action repetition counts.
        predictionTask?.cancel()
    }

    /// Display poses on top of each camera frame.
    func displayPoseInCamera() async throws {
        // Start reading the camera.
        let frameSequence = try await VideoReader.readCamera(
            configuration: configuration
        )
        var lastTime = CFAbsoluteTimeGetCurrent()

        for try await frame in frameSequence {

            if Task.isCancelled {
                return
            }

            // Extract poses in every frame.
            let poses = try await poseExtractor.applied(to: frame.feature)

            // Send poses into another pose stream for additional consumers.
            await poseStream.send(TemporalFeature(id: frame.id, feature: poses))

            // Calculate poses from the image frame and display both.
            if let cgImage = CIContext()
                .createCGImage(frame.feature, from: frame.feature.extent) {
                await display(image: cgImage, poses: poses)
            }

            // Frame rate debug information.
            print(String(format: "Frame rate %2.2f fps", 1 / (CFAbsoluteTimeGetCurrent() - lastTime)))
            lastTime = CFAbsoluteTimeGetCurrent()
        }
    }
    

    
    /// Predict the action repetition count.
    func predictCount() async throws {
        // Create an asynchronous temporal sequence for the pose stream.
        let poseTemporalSequence = AnyTemporalSequence<[Pose]>(poseStream, count: nil)

        // Apply the repetition-counting transformer pipeline to the incoming pose stream.
        let finalResults = try await actionCounter.count(poseTemporalSequence)

        var lastTime = CFAbsoluteTimeGetCurrent()
        for try await item in finalResults {

            if Task.isCancelled {
                return
            }

            let currentCumulativeCount = item.feature
            // Observe each predicted count (cumulative) and compare it to the previous result.
            
            // CODE BELLOW FOR RESET COUNT TO ZERO IF ISN'T INCREASE (I WON'T HEHEHE)
            /*
             if currentCumulativeCount - lastCumulativeCount <= 0.001 {
                // Reset the UI counter to 0 if the cumulative count isn't increasing.
                uiCount = 0.0
             }
             */
            
            // If detected
            if currentCumulativeCount - lastCumulativeCount >= 0.001 {
                AudioServicesPlaySystemSound(1323)
                isDetected = true

            } 
            // If not detected
            if currentCumulativeCount - lastCumulativeCount < 0.001 {
                isDetected = false
            }
            
            // Achieve the target count
            if uiCount >= 5 {
                playSound(name: "mclaren", extensionFile: "mp3")
                showOverlay = true
                showMenuScreen = true
                uiCount = 0.0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.showOverlay = false
                            }
                        }
            }
            

            // Add the incremental count to the UI counter.
            uiCount += currentCumulativeCount - lastCumulativeCount
            
            

            // Counter debug information.
            print("""
                    Cumulative count \(currentCumulativeCount), last count \(lastCumulativeCount), \
                    incremental count \(currentCumulativeCount - lastCumulativeCount), UI count \(uiCount)
                    """)

            // Update and store the last predicted count.
            lastCumulativeCount = currentCumulativeCount

            // Prediction rate debug information.
            print(String(format: "Count rate %2.2f fps", 1 / (CFAbsoluteTimeGetCurrent() - lastTime)))
            lastTime = CFAbsoluteTimeGetCurrent()
        }
    }

    /// Updates the user interface's image view with the rendered poses.
    /// - Parameters:
    ///   - image: The image frame from the camera.
    ///   - poses: The detected poses to render onscreen.
    /// - Tag: display
    @MainActor func display(image: CGImage, poses: [Pose]) {
        self.liveCameraImageAndPoses = (image, poses)
    }
}
