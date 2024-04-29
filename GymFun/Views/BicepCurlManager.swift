//
//  BicepCurlManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct BicepCurlManager: View {
    @State private var showingMainView = false
    @State private var showingStartView = false
    @StateObject var viewModel = ViewModel()

    
    var body: some View {
        VStack {
            if showingMainView {
                CameraWithPosesAndOverlaysView()
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
    BicepCurlManager()
    
}
