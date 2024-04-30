//
//  BicepCurlManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct MultiJumpingJackManager: View {
    @State private var showingMainView = false
    @State private var showingStartView = false

    
    var body: some View {
        VStack {
            if showingMainView {
                MenuView()
            }
            else if showingStartView {
                CongratulationView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
                            withAnimation {
                                self.showingMainView = true
                            }
                        }
                }
            } else {
                OverlayFeedbackFull()
                    .onAppear {
                        playSound(name: "achievement", extensionFile: "mp3")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.showingStartView = true
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    MultiJumpingJackManager()
}
