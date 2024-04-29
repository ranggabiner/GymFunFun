//
//  MultiExerciseView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct MultiExerciseView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.orange))
            // .navigationBarBackButtonHidden(true) (for can't back to old page)
            NavigationLink(destination: MultiExerciseManager()
                .navigationBarBackButtonHidden(true)
            ) {
                GifImageView("multiExercise")
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
            }
        }
        .background(Color(.orange))
        
    }
}

#Preview {
    MultiExerciseView()
}
