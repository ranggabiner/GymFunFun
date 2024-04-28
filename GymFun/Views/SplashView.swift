//
//  SplashView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            AnimationSplash(name: "potatoPullUp", loopMode: .loop)
            Text("GymFun developed by Team 6")
                .bold()
                .font(.title3)
                .foregroundStyle(Color(.black))
                .padding(.top, -50)
            Spacer()
        }
        .background(Color(.orange))
    }
}

#Preview {
    SplashView()
}
