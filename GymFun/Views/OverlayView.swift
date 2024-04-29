//
//  OverlayView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

/// - Tag: OverlayView
struct OverlayView: View {

    @State var isPresented = false
    
    var overlayCount: Bool
    let percent: CGFloat
    let flip: () -> Void

    var body: some View {
            
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            VStack {
                                ZStack(alignment: .leading) {
                                    ZStack {
                                        Capsule().fill(Color.black.opacity(0.08 )).frame(height: 22)
                                    }
                                    Capsule()
                                        .fill(LinearGradient(gradient: .init(colors: [Color(.orange), Color(.red)]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: calcPercent(), height: 22)
                                }

                            }
                            Spacer()
                        }.bubbleBackground()

                        Spacer()

                        HStack {
                            Button {
                                flip()
                            } label: {
                                Label("Flip", systemImage: "arrow.triangle.2.circlepath.camera.fill")
                                    .foregroundColor(.primary)
                                    .labelStyle(.iconOnly)
                                    .bubbleBackground()
                            }

                            Spacer()
                        
                            
                            Button { 
                                isPresented = true
                            } label: {
                                Label("Back", systemImage: "return")
                                    .bold()
                                    .foregroundColor(.orange)
                                    .labelStyle(.iconOnly)
                                    .padding()
                                    .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(.white))
                                            )
                            }
                            .fullScreenCover(isPresented: $isPresented, content: {
                                MenuView()
                            })

                        }
                    }.padding()
                    if overlayCount {
                        OverlayFeedbackFull()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                }
                                withAnimation {
                                    
                                }
                        }
                    }
                }
        }
    
    func calcPercent() -> CGFloat {
        let width = UIScreen.main.bounds.width - 80
        
        return width * CGFloat(percent)
    }
}



extension View {
    func bubbleBackground() -> some View {
        self.padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.primary)
                    .opacity(0.4)
            }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView(overlayCount: true, percent: 6 / 10) { }
            .background(Color.red.opacity(0.4))

    }
}
