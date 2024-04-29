//
//  JumpingJackManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct JumpingJackManager: View {
    @State private var showingMainView = false
    @State private var showingStartView = false
    
    var body: some View {
        VStack {
            if showingMainView {
                CameraWithPosesAndOverlaysView() }
            else if showingStartView {
                StartView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                self.showingMainView = true
                            }
                        }
                }
            } else {
                JumpingJackView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 22) {
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
    JumpingJackManager()
}
