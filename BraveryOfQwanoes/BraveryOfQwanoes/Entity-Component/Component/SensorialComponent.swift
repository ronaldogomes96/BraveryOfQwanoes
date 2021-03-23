//
//  SensorialComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit
import CoreLocation

class SensorialComponent: GKComponent, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var isPuzzle = false
    var isleft = false
    var isright = false
    var isPuzzleEnd = false
    var initialPosiiton: CLLocationDirection?
    
    override init() {
        super.init()
        initialConfigurationForLocationManager()
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
        }
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
            print(transformHeading)
        }
        
        print(heading.magneticHeading)
    }
    
}
