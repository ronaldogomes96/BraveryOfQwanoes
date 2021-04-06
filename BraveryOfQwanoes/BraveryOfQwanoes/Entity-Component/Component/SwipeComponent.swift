//
//  SwipeComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 06/04/21.
//

import Foundation
import GameplayKit
import CoreHaptics

class SwipeComponent: GKComponent {

    var isPuzzleEnd = false
    
    func swipeSender(_ sender: UISwipeGestureRecognizer) {
        swipeFeedback()
        if sender.direction == .up {
            isPuzzleEnd = true
            print(isPuzzleEnd)
        }
    }
    
    func swipeFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
}
