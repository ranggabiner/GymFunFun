//
//  MenuView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: SingleExerciseView()) {
                    Text("😅")
                        .font(.system(size: 150))
                }
                Spacer()
                Spacer()
                NavigationLink(destination: MultiExerciseView()) {
                    Text("🥵")
                        .font(.system(size: 150))
                }
                Spacer()
            }
            .padding(120)
            .background(Color(.orange))
        }
    }
}



#Preview {
    MenuView()
}
