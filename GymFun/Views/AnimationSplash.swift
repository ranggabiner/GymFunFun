//
//  AnimationSplash.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

import Lottie

struct AnimationSplash: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "potatoPullUp")
        animationView.loopMode = loopMode
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
    }
}

#Preview {
    AnimationSplash(name: "potatoPullUp", loopMode: .loop)
}
