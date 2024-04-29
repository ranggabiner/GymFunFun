//
//  SingleExerciseView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct SingleExerciseView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)
            VStack {
                Spacer()
                //.navigationBarBackButtonHidden(true) (for can't back to old screen)
                NavigationLink(destination: BicepCurlManager()
                    .navigationBarBackButtonHidden(true)) {
                    GifImageView("bicepCurl")
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                }
                Spacer()
                //.navigationBarBackButtonHidden(true) (for can't back to old screen)
                NavigationLink(destination: SquatManager()
                    .navigationBarBackButtonHidden(true)) {
                    GifImageView("squat")
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                }
                Spacer()
                //.navigationBarBackButtonHidden(true) (for can't back to old screen)
                NavigationLink(destination: JumpingJackManager()
                    .navigationBarBackButtonHidden(true)) {
                    GifImageView("jumpingJack")
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                }
                
                Spacer()
            }
        }
        .background(Color.orange)   
        .navigationBarBackButtonTitleHidden()
    }
}

#Preview {
    SingleExerciseView()
}
