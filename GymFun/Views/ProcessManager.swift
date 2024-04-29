//
//  ProcessManager.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct ProcessManager: View {
    @State private var showingMainView = false
    
    let ending: Bool
    
    var body: some View {
        VStack {
            if ending {
                MenuView()
            } else {
                CameraWithPosesAndOverlaysView()
            }
        }
    }
}

#Preview {
    ProcessManager(ending: true)
}
