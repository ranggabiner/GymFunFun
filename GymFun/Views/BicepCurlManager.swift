//
//  BicepCurlManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct BicepCurlManager: View {
    @State private var showingMainView = false
    
    var body: some View {
        VStack {
            if showingMainView {
                CameraWithPosesAndOverlaysView()
            } else {
                BicepCurlView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 22) {
                            withAnimation {
                                self.showingMainView = true
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    BicepCurlManager()
    
}
