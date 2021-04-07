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
    private var engine: CHHapticEngine = try! CHHapticEngine()
    private var continuousPlayer: CHHapticPatternPlayer?
    
    override init() {
        super.init()
        phoneVibrationsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func swipeSender(_ sender: UISwipeGestureRecognizer) {
        swipeFeedback()
        if sender.direction == .up {
            isPuzzleEnd = true
            print(isPuzzleEnd)
        }
    }
    
    func swipeFeedback() {
        try? continuousPlayer?.start(atTime: 0)
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            try? self.continuousPlayer?.stop(atTime: .zero)
        }
    }
    
    func phoneVibrationsConfiguration() {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.5)
        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            continuousPlayer = try engine.makePlayer(with: pattern)

            try engine.start()
        } catch {
            print("Haptic Error: \(error.localizedDescription).")
        }
        
    }
}
