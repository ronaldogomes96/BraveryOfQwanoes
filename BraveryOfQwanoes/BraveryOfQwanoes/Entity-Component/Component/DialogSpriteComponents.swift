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
            let node = SKLabelNode(text: "\(dialog)")
            node.fontSize = 30
            node.numberOfLines = 0
            node.horizontalAlignmentMode = .center
            node.preferredMaxLayoutWidth = 300
            node.fontName = "SueEllenFrancisco"
            node.color = .white
            spriteNode.append(node)
        }
        return spriteNode
    }

    var spritePuzzleNode: SKLabelNode? {
        let string = self.entity?.component(ofType: DialogsComponent.self)?.history.puzzle
        let sprite = SKLabelNode(text: "\(string ?? "Puzzle")")
        sprite.fontSize = 30
        sprite.numberOfLines = 0
        sprite.horizontalAlignmentMode = .center
        sprite.preferredMaxLayoutWidth = 200
        sprite.color = .white
        sprite.fontName = "SueEllenFrancisco"
        return sprite
    }

}
