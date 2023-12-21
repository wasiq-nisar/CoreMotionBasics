//
//  ViewController.swift
//  MotionManager-Basics
//
//  Created by Muhammad Wasiq  on 24/11/2023.
//


import UIKit
import CoreMotion

class ViewController: UIViewController {
    //private let motionManager = MotionManager()
    private var label: UILabel!
    let motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabel()

//        motionManager.startUpdates { [weak self] (deviceMotion, error) in
//            guard let deviceMotion = deviceMotion else { return }
//            DispatchQueue.main.async {
//                self?.updateLabel(deviceMotion: deviceMotion)
//            }
//        }
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                print(data?.acceleration.z)
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        motionManager.stopUpdates()
    }

    private func setupLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        label.center = view.center
        label.textAlignment = .center
        label.numberOfLines = 0
        view.addSubview(label)
    }

    private func updateLabel(deviceMotion: CMDeviceMotion) {
        let attitude = deviceMotion.attitude
        let rotationRate = deviceMotion.rotationRate
        let gravity = deviceMotion.gravity
        let userAcceleration = deviceMotion.userAcceleration

        let labelText = """
        Attitude: (pitch: \(attitude.pitch), roll: \(attitude.roll), yaw: \(attitude.yaw))
        Rotation Rate: (x: \(rotationRate.x), y: \(rotationRate.y), z: \(rotationRate.z))
        Gravity: (x: \(gravity.x), y: \(gravity.y), z: \(gravity.z))
        User Acceleration: (x: \(userAcceleration.x), y: \(userAcceleration.y), z: \(userAcceleration.z))
        """

        label.text = labelText
    }
}
  

