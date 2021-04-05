//
//  SensorialComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit
//import CoreLocation
import CoreMotion

class SensorialComponent: GKComponent {
    
    let motionManager = CMMotionManager()
    var isPuzzle = false
    var isleft = false
    var isright = false
    var position: Double = 0.0
    
    override init() {
        super.init()
        setupCoreMotion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isPuzzleEnd() -> Bool {
        if position >= (90.degreeToRadian()) {
            isleft = true
        }
        if position <= (-90.0.degreeToRadian()) {
            isright = true
        }
        if isleft && isright {
            return true
        }
        return false
    }
    
    func setupCoreMotion() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates()
            motionManager.startDeviceMotionUpdates(to: OperationQueue()) { [weak self] (motion, error) -> Void in
                if let iphoneMotion = motion?.rotationRate.z {
                    if iphoneMotion > 0.1 || iphoneMotion < -0.1 {
                        self?.position += ( Double(iphoneMotion) / 7 )
                    }
                    
                }
            }
        }
    }
}
