//
//  BicepMultiView.swift
//  GymFun
//
//  Created by ahmad naufal alfakhar on 30/04/24.
//

import SwiftUI

struct BicepMultiView: View {
    @State private var showingMainView = false
    @State private var showingStartView = false
    
    @ObservedObject var viewModel: ViewModel
        

    
    var body: some View {
        VStack {
            if showingMainView {
                MultiCameraWithPosesAndOverlaysView(viewModel: viewModel)
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
    BicepMultiView(viewModel: ViewModel.preview())
}
