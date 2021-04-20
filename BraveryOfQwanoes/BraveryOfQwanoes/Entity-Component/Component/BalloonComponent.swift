//
//  BalloonComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 20/04/21.
//

import Foundation
import GameplayKit

class BalloonComponent: GKComponent {
    var ballonNode: SKSpriteNode
    
    init(spriteName: String) {
        self.ballonNode = SKSpriteNode(imageNamed: spriteName)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
