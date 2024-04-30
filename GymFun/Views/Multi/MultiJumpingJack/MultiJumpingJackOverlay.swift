//
//  OverlayView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI

/// - Tag: OverlayView
struct MultiJumpingJackOverlay: View {
    
    var detected: Bool?
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
                        }
                    }.padding()
                    if detected ?? false {
                        FloatersView()
                    }
                    if overlayCount {
                        EndingManager()
                    }
                }
        }
    
    func calcPercent() -> CGFloat {
        let width = UIScreen.main.bounds.width - 80
        
        return width * CGFloat(percent)
    }
}



struct MultiJumpingJackOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        MultiJumpingJackOverlay(detected: true, overlayCount: false, percent: 10 / 10) { }
            .background(Color.red.opacity(0.4))

    }
}
