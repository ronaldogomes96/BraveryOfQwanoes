//
//  TotenComponent.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 06/04/21.
//

import Foundation
import GameplayKit

class TotenComponent: GKComponent {

    var totenNode: SKSpriteNode
    init(totenName: String) {
        self.totenNode = SKSpriteNode(imageNamed: totenName)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
