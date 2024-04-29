//
//  BicepCurlView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct BicepCurlView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.orange))
                GifImageView("bicepCurl_orange")
                .frame(width: 700, height: 700)
//                .onAppear {
//                    playSound(name: "sepuh", extensionFile: "mp3")
//                }
        }
        .background(Color(.orange))
    }
}

#Preview {
    BicepCurlView()
}
