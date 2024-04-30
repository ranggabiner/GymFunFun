//
//  ExerciseTransitionView.swift
//  GymFun
//
//  Created by ahmad naufal alfakhar on 30/04/24.
//

import SwiftUI

struct ExerciseTransitionView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.showMenuScreen {
                TransitionView()
            } else {
                switch viewModel.currentExercise {
                case .bicep:
                    BicepMultiView(viewModel: viewModel)
                case .jumping:
                    JumpingMultiView(viewModel: viewModel)
                case .squat:
                    SquatMultiView(viewModel: viewModel)
                case .finish:
                    FinishView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    ExerciseTransitionView(viewModel: ViewModel.preview())
}
