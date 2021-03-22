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
    
    func initialConfigurationForLocationManager() {
        if CLLocationManager.headingAvailable() {
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
            locationManager.delegate = self
            isPuzzle = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        if !isPuzzle {
            initialPosiiton = heading.magneticHeading
        }
        if initialPosiiton ?? heading.magneticHeading >= (heading.magneticHeading + 180) {
            isleft = true
        }
        if initialPosiiton ?? heading.magneticHeading <= (heading.magneticHeading - 180) {
            isright = true
        }
        if isleft && isright {
            isPuzzleEnd = true
        }
    }
}
