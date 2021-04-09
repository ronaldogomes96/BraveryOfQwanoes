//
//  EndGameScene.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 09/04/21.
//

import Foundation
import UIKit
import SpriteKit

class EndGameScene: SKScene {

    let background = Background(name: "space_background")
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackgroundNode()
    }
    
    func setupBackgroundNode() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.size.width = self.size.width
        backgroundComponent.size.height = self.size.height
        backgroundComponent.position = CGPoint(x: backgroundComponent.size.width/2, y: self.frame.midY)
        self.addChild(backgroundComponent)
    }
}
