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
    
    var jsonNames = ["Introduction", "PartOne", "PartTwo", "PartThree", "PartFour", "PartFive"]
    var dialog = Dialog(historyPart: "Introduction")
    var dialogNodes = [SKLabelNode]()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        //self.backgroundColor = .purple
        self.backgroundColor = .blue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(swipeGesture))
        view.addGestureRecognizer(tap)
        actualDialog()
        setupDialogNode()
    }
    
    @objc func swipeGesture(_ sender: UITapGestureRecognizer) {

        switch sender.state {
        case .ended:
            dialogNodes.removeFirst()
            setupDialogNode()
        default:
            break
        }
    }

    func setupDialogNode() {
        if dialogNodes.isEmpty {
            jsonNames.removeFirst()
            dialog = Dialog(historyPart: jsonNames[0])
            actualDialog()
        }
        removeAllChildren()
        let node = dialogNodes[0]
        node.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        node.color = .white
        self.addChild(node)
    }
    
    func actualDialog() {
        guard let dialogNodes = dialog.component(ofType: DialogSpriteComponent.self)?.spritesNodes,
              let puzzleNodes = dialog.component(ofType: DialogSpriteComponent.self)?.spritePuzzleNode else {
            fatalError()
        }
        
        self.dialogNodes = dialogNodes
        self.dialogNodes.append(puzzleNodes)
    }
}
