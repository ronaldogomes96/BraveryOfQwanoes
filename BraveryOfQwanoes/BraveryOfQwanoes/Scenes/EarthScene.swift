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
    lazy var velocity: Double = {
        return 100.0
    }()
    
    var background = Background(name: "rain")
    var dialog = Dialog(historyPart: "PartOne")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.backgroundColor = .black
        setupNodePosition()
        setupDialogNode()
    //        let tap = UITapGestureRecognizer(target: self, action: #selector(swipeGesture))
    //        view.addGestureRecognizer(tap)
    }
    
    func setupNodePosition() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.size.width = self.size.width
        backgroundComponent.size.width = self.size.height
        //backgroundComponent.size = CGSize(width: (scene?.size.width)!, height: 250)
        //backgroundComponent.scale(to: CGSize(width: self.size.width, height: self.size.height))
        backgroundComponent.position = CGPoint(x: backgroundComponent.size.width/2, y: self.frame.midY)
    
        
        let duration = Double(backgroundComponent.size.width/2)/velocity // tem haver com física tempo = espaço/velocidade
        let moveFloorAction = SKAction.moveBy(x: -backgroundComponent.size.width/2, y: 0, duration: duration)
        let resetXAction = SKAction.moveBy(x: backgroundComponent.size.width/2, y: 0, duration: 0)
        let sequenceActions = SKAction.sequence([moveFloorAction,resetXAction])
        let repeatAction = SKAction.repeatForever(sequenceActions)
        backgroundComponent.run(repeatAction)
        
        self.addChild(backgroundComponent)
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
