//
//  DialogSpriteComponents.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 18/03/21.
//

import Foundation
import SpriteKit
import GameplayKit

class DialogSpriteComponent: GKComponent {
    
    var spritesNodes: [SKLabelNode] = [SKLabelNode]()
    var spritePuzzleNode: SKLabelNode = SKLabelNode()
    
    init(listOfDialogs: [String]) {
        for dialog in listOfDialogs {
            spritesNodes.append(SKLabelNode(text: "\(dialog)"))
        }
        super.init()
    }
    
    init(puzzle: String) {
        spritePuzzleNode = SKLabelNode(text: "\(puzzle)")
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
