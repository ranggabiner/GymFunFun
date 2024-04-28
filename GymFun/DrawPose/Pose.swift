//
//  Pose.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import SwiftUI
import CreateMLComponents

/// Stores the joints and connections of a human body pose and draws them as
/// a wireframe.
/// - Tag: Pose
extension Pose {

    /// Draws all the valid connections and joints of the wireframe.
    /// - Parameters:
    ///   - context: A context the method uses to draw the wireframe.
    ///   - transform: A transform that modifies the point locations.
    /// - Tag: drawWireframe
    func drawWireframe(to context: GraphicsContext,
                       applying transform: CGAffineTransform = .identity) {
        let scale = drawingScale

        let connections = buildConnections()

        // Draw the connection lines first.
        for line in connections {
            line.drawConnection(to: context,
                                applying: transform,
                                at: scale)
        }

        // Draw the landmarks on top of the lines' endpoints.
        for (_, joint) in keypoints where joint.confidence >= JointPoint.confidenceThreshold {
            joint.drawJoint(to: context,
                            applying: transform,
                            at: scale)
        }
    }

    /// Adjusts the joint landmark radius and connection thickness when the pose draws
    /// itself as a wireframe.
    private var drawingScale: CGFloat {
        /// The typical size of a dominant pose.
        ///
        /// The sample's author empirically derives this value.
        let typicalLargeVisualPoseArea: Float = 0.35

        /// The largest scale is 100%.
        let max: Float = 1.0

        /// The smallest scale is 60%.
        let min: Float = 0.6

        /// The area's ratio relative to the typically large pose area.
        let ratio = boundingBoxArea() / typicalLargeVisualPoseArea

        let scale = ratio >= max ? max : (ratio * (max - min)) + min

        let factor: CGFloat = 0.5

        return CGFloat(scale) * factor
    }
}
