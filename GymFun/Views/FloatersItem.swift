//
//  FloatersItem.swift
//  GymFun
//
//  Created by Rangga Biner on 29/04/24.
//

import SwiftUI

struct FloatersItem: View {
    @State var loc: CGPoint
    @State var opacity = 1.0

    var body: some View {
        Text("🔥")
            .font(.system(size: 50))
            .position(loc)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.spring(duration: 2.3)) {
                    loc = CGPoint(x: .random(in: loc.x - 80 ... loc.x + 80), y: 0)
                    opacity = 0
                }
            }
    }
}

#Preview {
    FloatersItem(loc: CGPoint(x: 100, y: 100))
}
