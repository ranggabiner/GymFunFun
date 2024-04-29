//
//  CongratulationView.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct CongratulationView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.orange))
            
            VideoManager(videoName: "congratulation_guy")
                .frame(width: UIScreen.main.bounds.width, height: 500)
                .scaleEffect(1.8) // Adjust the scale factor as needed
                .offset(x: -90, y: 0) // Adjust the offset as needed
        }
        .background(Color(.orange))
    }
}

#Preview {
    CongratulationView()
}
