//
//  EarthScene.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit
import SpriteKit

class EarthScene: SKScene {
    
    var background = Background(name: "background_grande")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.backgroundColor = .purple
        setupNodePosition()
    }
    
    func setupNodePosition() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(backgroundComponent)
    }
}
