//
//  DynamicBackgroundComponent.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 18/03/21.
//

import Foundation
import GameplayKit

class DynamicBackgroundComponent: GKComponent {
    
    var backgroundNode: SKSpriteNode
    init(backgroundName: String) {
        self.backgroundNode = SKSpriteNode(imageNamed: backgroundName)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
