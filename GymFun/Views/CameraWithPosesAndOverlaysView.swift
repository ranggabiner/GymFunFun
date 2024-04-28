//
//  CameraWithPosesAndOverlaysView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct CameraWithPosesAndOverlaysView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
        OverlayView(count: viewModel.uiCount) {
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

struct CameraWithOverlaysView_Previews: PreviewProvider {
    static var previews: some View {
        CameraWithPosesAndOverlaysView()
    }
}
