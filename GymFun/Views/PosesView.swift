//
//  PosesView.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI
import CreateMLComponents

/// - Tag: PosesView
struct PosesView: View {

    let poses: [Pose]

    var body: some View {
        Canvas { context, size in
            // Create a transform that converts the poses' normalized point
            // coordinates `[0.0, 1.0]` to properly fit the frame's size.

            let pointTransform: CGAffineTransform =
                .identity
                .translatedBy(x: 0.0, y: -1.0)
                .concatenating(.identity.scaledBy(x: 1.0, y: -1.0))
                .concatenating(.identity.scaledBy(x: size.width, y: size.height))

            // Draw all the poses Vision finds in the frame.
            for pose in poses {
                // Draw each pose as a wireframe at the scale of the image.
                pose.drawWireframe(to: context, applying: pointTransform)
            }
        }
    }
}

struct PosesView_Previews: PreviewProvider {
    static var previews: some View {
        PosesView(poses: [])
    }
}
