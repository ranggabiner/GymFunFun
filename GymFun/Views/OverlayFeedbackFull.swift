//
//  OverlayFeedbackFull.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI
import Lottie

struct OverlayFeedbackFull: View {
    
    var fileName: String = "StarAnimation.json"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.orange))
            LottieView(animation: .named(fileName))
                .configure({ lottieAnimationView in
                    lottieAnimationView.contentMode = contentMode
                })
                .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
                .animationDidFinish { completed in
                    onAnimationDidFinish?()
                }
        }
        .background(Color(.orange))
    }
}


#Preview {
    OverlayFeedbackFull()
}
