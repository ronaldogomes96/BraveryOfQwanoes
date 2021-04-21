//
//  CharacterComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 20/04/21.
//

import Foundation
import GameplayKit

class CharacterComponent: GKComponent {
    
    var characterNode: SKSpriteNode
    
    init(spriteName: String) {
        self.characterNode = SKSpriteNode(imageNamed: spriteName)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
