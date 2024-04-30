//
//  CameraWithPosesAndOverlaysView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct MultiJumpingJackCameraOverlayAndViews: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
        MultiJumpingJackOverlay(detected: viewModel.isDetected, overlayCount: viewModel.showOverlay, percent: CGFloat(viewModel.uiCount) / 5) {
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
    }
}

struct MultiJumpingJackCameraOverlayAndViews_Previews: PreviewProvider {
    static var previews: some View {
        MultiJumpingJackCameraOverlayAndViews()
    }
}
