//
//  StartView.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct StartView: View {
    let countdownElements = ["🤟🏻", "✌🏻", "☝🏻", "🫵🏻"]
        @State private var countdownIndex = 0
        @State private var countdownText = ""
        @State private var timer: Timer?

    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.orange))
            VStack {
                        Text(countdownText)
                            .font(.system(size: 200))
                            .onAppear {
                                startCountdown()
                                playSound(name: "321go", extensionFile: "mp3")
                            }
                    }
        }
        .background(Color(.orange))

    }
    
    func startCountdown() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true) { timer in
                if countdownIndex < countdownElements.count {
                    countdownText = countdownElements[countdownIndex]
                    countdownIndex += 1
                } else {
                    timer.invalidate()
                }
            }
        }
}

#Preview {
    StartView()
}
