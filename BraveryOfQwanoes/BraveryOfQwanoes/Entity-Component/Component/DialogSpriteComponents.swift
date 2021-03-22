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
            node.color = .red
            node.fontColor = UIColor(red: 0.49, green: 0.32, blue: 0.22, alpha: 1.00)
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
        sprite.fontColor = UIColor(red: 0.49, green: 0.32, blue: 0.22, alpha: 1.00)
        sprite.fontName = "SueEllenFrancisco"
        return sprite
    }

}
