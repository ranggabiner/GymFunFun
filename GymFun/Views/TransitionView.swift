//
//  TransitionView.swift
//  GymFun
//
//  Created by ahmad naufal alfakhar on 30/04/24.
//

import SwiftUI

struct TransitionView: View {
    
    var body: some View {
        LottieHelper(fileName: "StarAnimation", playLoopMode: .playOnce)
    }
}

#Preview {
    TransitionView()
}
