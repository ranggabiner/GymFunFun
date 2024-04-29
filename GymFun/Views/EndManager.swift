//
//  EndManager.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct EndManager: View {
    @State private var showingMainView = false
    
    var body: some View {
        VStack {
            if showingMainView {
                MenuView()
            } else {
                CongratulationView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 24) {
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
    EndManager()
}
