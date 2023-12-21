//
//  MotionManager.swift
//  MotionManager-Basics
//
//  Created by Muhammad Wasiq  on 24/11/2023.
//

import Foundation
import CoreMotion

class MotionManager {
    private let motionManager = CMMotionManager()

    func startUpdates(handler: @escaping (CMDeviceMotion?, Error?) -> Void) {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: .main, withHandler: handler)
        }
    }

    func stopUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.stopDeviceMotionUpdates()
        }
    }
}
  
/*
 This class provides a simple interface to start and stop receiving updates from Core Motion. 
 It uses the CMMotionManager class to access device motion data and calls the provided handler with the latest data every 0.1 seconds
 */
