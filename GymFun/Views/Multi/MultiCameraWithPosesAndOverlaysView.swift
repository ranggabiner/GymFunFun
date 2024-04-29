//
//  MultiCameraWithPosesAndOverlaysView.swift
//  GymFun
//
//  Created by ahmad naufal alfakhar on 30/04/24.
//

import SwiftUI

struct MultiCameraWithPosesAndOverlaysView: View {
    @ObservedObject var viewModel: ViewModel

        var body: some View {
            if viewModel.showMenuScreen {
                // Display the menu screen here
                TransitionView()
            } else {
                OverlayView(overlayCount: viewModel.showOverlay, percent: CGFloat(viewModel.uiCount) / 5) {
                    viewModel.onCameraButtonTapped()
                }
                .background {
                    if let (image, poses) = viewModel.liveCameraImageAndPoses {
                        CameraView(
                            cameraImage: image
                        )
                        .overlay {
                            PosesView(poses: poses)
                        }
                        .ignoresSafeArea()
                    }
                }
                .onAppear {
                    viewModel.initialize()
                }
                .onDisappear {
                    viewModel.stopVideoProcessingPipeline()
                }
            }
        }}

#Preview {
    MultiCameraWithPosesAndOverlaysView(viewModel: ViewModel.preview())
}
