//
//  LottieHandler.swift
//  GymFun
//
//  Created by ahmad naufal alfakhar on 30/04/24.
//

import SwiftUI
import Lottie   

struct LottieHelper: View {
    var fileName: String = "StarAnimation.json"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure({ lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
            })
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
    }
}

#Preview {
    LottieHelper()
}
