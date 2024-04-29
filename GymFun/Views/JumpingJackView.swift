//
//  JumpingJackView.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct JumpingJackView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.orange))
                GifImageView("jumpingJack_orange")
                .frame(width: 700, height: 700)
                .onAppear {
                    playSound(name: "sepuh", extensionFile: "mp3")
                }
        }
        .background(Color(.orange))
    }
}

#Preview {
    JumpingJackView()
}
