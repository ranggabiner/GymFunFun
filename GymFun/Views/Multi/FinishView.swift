//
//  FinishView.swift
//  GymFun
//
//  Created by ahmad naufal alfakhar on 30/04/24.
//

import SwiftUI

struct FinishView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State var isPresented = false
    
    var body: some View {
        VStack{
            Text("🥳")
                .font(.system(size: 150))
            Button {
                viewModel.resetExercises()
                isPresented = true
            } label: {
                Label("Back", systemImage: "return")
                    .bold()
                    .foregroundColor(.orange)
                    .labelStyle(.iconOnly)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.white))
                    )
            }
            .fullScreenCover(isPresented: $isPresented, content: {
                MenuView()
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.edgesIgnoringSafeArea(.all))    }
}

#Preview {
    FinishView(viewModel: ViewModel.preview())
}
