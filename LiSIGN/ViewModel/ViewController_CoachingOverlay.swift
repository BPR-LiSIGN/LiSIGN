//
//  ViewController_CoachingOverlay.swift
//  LiSIGN
//  RoomScanViewModel extension for the on-boarding experience.
//

import ARKit
import UIKit

extension RoomScanViewModel: ARCoachingOverlayViewDelegate {
    
    func coachingOverlayViewActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        resetButton.isHidden = true
        planeDetectionButton.isHidden = true
        saveButton.isHidden = true
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        resetButton.isHidden = false
        planeDetectionButton.isHidden = false
        saveButton.isHidden = false
    }
    
    func coachingOverlayViewRequestSessionReset(_ coachingOverlayView: ARCoachingOverlayView) {
        resetButtonPressed(self)
    }
    
    func setupCoachingOverlay() {
        // Set up coaching view
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        
        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
        arView.addSubview(coachingOverlay)
        
        NSLayoutConstraint.activate([
            coachingOverlay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coachingOverlay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coachingOverlay.widthAnchor.constraint(equalTo: view.widthAnchor),
            coachingOverlay.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}