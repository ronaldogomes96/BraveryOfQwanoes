//
//  SensorialComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit
import CoreLocation
import CoreMotion

class SensorialComponent: GKComponent, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let motionManager = CMMotionManager()
    var isPuzzle = false
    var isleft = false
    var isright = false
    var isPuzzleEnd = false
    var initialPosiiton: CLLocationDirection?
    var position: Double = 0.0
    
    override init() {
        super.init()
        initialConfigurationForLocationManager()
        coreMotion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialConfigurationForLocationManager() {
        if CLLocationManager.headingAvailable() {
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
            locationManager.delegate = self
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        if !isPuzzle {
            initialPosiiton = heading.magneticHeading
        } else {
            if let initialPosiiton = initialPosiiton {
                var transformHeading = heading.magneticHeading
                if initialPosiiton < 45 {
                    transformHeading -= 45
                }
                if initialPosiiton > 315 {
                    transformHeading += 45
                }
                print("INITIAL POSITION: \(initialPosiiton)")
                if transformHeading >= (initialPosiiton  + 45) {
                    isleft = true
                }
                if transformHeading <= (initialPosiiton - 45) {
                    isright = true
                }
                if isleft && isright {
                    isPuzzleEnd = true
                }
                //print(transformHeading)
            }
//            self.headingBefore = self.headingActual
//            self.headingActual = heading.magneticHeading.magnitude - self.headingBefore
//            print("INITIAL: \(heading.magneticHeading.magnitude)")
//            print("INITIAL ACTUAL: \(headingActual)")
//            print("INITIAL BEFORE: \(headingBefore)")
        }
    }
    
    func coreMotion() {
        
        if motionManager.isDeviceMotionAvailable {
            
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates()
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue()) { [weak self] (motion, error) -> Void in
                
                if let attitude = motion?.rotationRate.z {
                    
                    self?.position = Double(attitude)
                    
                    DispatchQueue.main.async{
                        // Update UI
                    }
                }
                
            }
            
            print("Device motion started")
        }
        else {
            print("Device motion unavailable")
        }
    }
}
