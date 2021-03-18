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
    
    var dialog = Dialog(historyPart: "PartOne")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        //self.backgroundColor = .purple
        self.backgroundColor = .black
//        let tap = UITapGestureRecognizer(target: self, action: #selector(swipeGesture))
//        view.addGestureRecognizer(tap)
        setupDialogNode()
    }

    func setupDialogNode() {
        guard let dialogNodes = dialog.component(ofType: DialogSpriteComponent.self)?.spritesNodes else {
            fatalError()
        }
        
        for node in dialogNodes {
            node.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            node.color = .white
            self.addChild(node)
        }
    }
}
