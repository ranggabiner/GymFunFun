//
//  BicepCurlManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct MultiBicepManager: View {
    @State private var showingMainView = false
    @State private var showingStartView = false

    
    var body: some View {
        VStack {
            if showingMainView {
                MultiBicepCameraOverlayAndViews()
            }
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
                BicepCurlView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
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
    MultiBicepManager()
}
