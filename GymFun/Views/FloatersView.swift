//
//  FloatersView.swift
//  GymFun
//
//  Created by Rangga Biner on 30/04/24.
//

import SwiftUI

struct FloatersView: View {
    @State var index = 0
    @State var loves: [String] = ["test"]
    
    var body: some View {
            ZStack {
                ForEach(0 ..< loves.count, id: \.self) { _ in
                    FloatersItem(loc: CGPoint(x: CGFloat.random(in: 0...(UIScreen.main.bounds.width)),
                                              y: CGFloat.random(in: 0...(UIScreen.main.bounds.height))))
                }
            }
            .onAppear {
                self.addLove()
            }
        }

    
    func addLove() {
        // Tambahkan elemen ke dalam array loves
        loves.append("ya")
        
        // Setelah menambahkan elemen, atur untuk menambah lagi dalam waktu yang ditentukan
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.addLove()
        }
    }
}

#Preview {
    FloatersView()
}
