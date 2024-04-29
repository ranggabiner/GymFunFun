//
//  BicepCurlView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct BicepCurlView: View {
    var body: some View {
        VStack {
            GifImageView("bicepCurl")
                .frame(width: 800, height: 800)
                .onAppear {
                    playSound(name: "sepuh", extensionFile: "mp3")
            }
        }
    }
}

#Preview {
    BicepCurlView()
}
