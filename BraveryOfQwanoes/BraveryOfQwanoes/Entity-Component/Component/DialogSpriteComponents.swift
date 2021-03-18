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
    
    var spritesNodes: [SKLabelNode]? {
        let strings: [String] = (self.entity?.component(ofType: DialogsComponent.self)?.historyInParts())!
        var spriteNode: [SKLabelNode] = [SKLabelNode]()
        for dialog in strings {
            spriteNode.append(SKLabelNode(text: "\(dialog)"))
        }
        return spriteNode
    }

    var spritePuzzleNode: SKLabelNode? {
        let string = self.entity?.component(ofType: DialogsComponent.self)?.history.puzzle
        let sprite = SKLabelNode(text: "\(String(describing: string))")
        return sprite
    }

}
