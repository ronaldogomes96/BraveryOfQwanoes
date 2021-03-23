//
//  PlayerControlComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit

class PlayerControlComponent: GKComponent {
    
    var playerNode: SKSpriteNode
    init(characterName: String) {
        self.playerNode = SKSpriteNode(imageNamed: characterName)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
