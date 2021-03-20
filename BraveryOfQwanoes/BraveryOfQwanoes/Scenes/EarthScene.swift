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

        self.backgroundColor = .blue

        let userTap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(userTap)

        setActualDialogNodes()
        setupDialogNodePosition()
    }

    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        switch sender.state {
            case .ended:
                dialogNodes.removeFirst()
                setupDialogNodePosition()
            default:
                break
        }
    }

    func setupDialogNodePosition() {
        //Caso seja o ultimo node, reinicia o dialogo e seu node
        if dialogNodes.isEmpty {
            jsonNames.removeFirst()
            dialog = Dialog(historyPart: jsonNames[0])
            setActualDialogNodes()
        }
        
        removeAllChildren()
        let node = dialogNodes[0]
        node.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(node)
    }
    
    func setActualDialogNodes() {
        guard let dialogNodes = dialog.component(ofType: DialogSpriteComponent.self)?.spritesNodes,
              let puzzleNodes = dialog.component(ofType: DialogSpriteComponent.self)?.spritePuzzleNode else {
            fatalError()
        }
        
        self.dialogNodes = dialogNodes
        self.dialogNodes.append(puzzleNodes)
    }
}
