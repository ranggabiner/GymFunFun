//
//  MultiExerciseManager.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct MultiExerciseManager: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        ExerciseTransitionView(viewModel: viewModel)
    }
}

#Preview {
    MultiExerciseManager()
}
