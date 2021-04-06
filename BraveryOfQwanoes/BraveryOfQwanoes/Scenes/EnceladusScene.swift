//
//  EnceladusScene.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import UIKit
import SpriteKit

class EnceladusScene: SKScene {
    
    let background = Background(name: "background_encelado")
    let toten = Toten(totenName: "geiser_enceladus")
    let character = CharacterBoat(characterName: "qwanoes_happy")
    var jsonNames = ["Introduction", "PartOne", "PartTwo", "PartThree", "PartFour", "PartFive"]
    var dialog = Dialog(historyPart: "PartOne")
    var dialogNodes = [SKLabelNode]()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackgroundNode()
        setupCharacter()
        //setupToten()
    }
    
    func setupBackgroundNode() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.size.width = self.size.width
        backgroundComponent.size.height = self.size.height
        backgroundComponent.position = CGPoint(x: backgroundComponent.size.width/2, y: self.frame.midY)
        self.addChild(backgroundComponent)
    }
    
    func setupCharacter() {
        guard let characterComponent = character.component(ofType: PlayerControlComponent.self)?.playerNode else {return}
        characterComponent.size.width = 280
        characterComponent.size.height = 280
        
        characterComponent.position = CGPoint(x: self.frame.midX - characterComponent.size.width/2.5, y: self.frame.midY - self.size.height/3.5)
        
        let rotateX = SKAction.rotate(byAngle: CGFloat(0.2), duration: 1.2)
        let rotateY = SKAction.rotate(byAngle: CGFloat(-0.2), duration: 1.2)
        let sequence = SKAction.sequence([rotateX, rotateY])
        let repeatAction = SKAction.repeatForever(sequence)
        
        characterComponent.run(repeatAction)
        self.addChild(characterComponent)
    }
    
    func setupToten() {
        guard let totenComponent = toten.component(ofType: TotenComponent.self)?.totenNode else {return}
        totenComponent.size.width = 160
        totenComponent.size.height = 240
        totenComponent.position = CGPoint(x: self.size.width/1.2, y: self.frame.midY/2.5)
        self.addChild(totenComponent)
    }
}

extension EnceladusScene: PauseGame {
    func pause() {
        let labelPause = SKLabelNode(text: "Deslize para cima para sair ou deslize para direita para continuar")
        labelPause.name = "PauseNode"
        labelPause.numberOfLines = 0
        labelPause.fontColor = .white
        labelPause.fontSize = 25
        labelPause.fontName = "SueEllenFrancisco"
        labelPause.horizontalAlignmentMode = .center
        labelPause.preferredMaxLayoutWidth = 300
        labelPause.position = CGPoint(x: self.frame.midX, y: self.frame.midY - self.frame.midY/4)
        self.addChild(labelPause)
    }
    
    func deleteNode(withName nameNode: String) {
        let child = self.scene?.childNode(withName: nameNode)
        child?.removeFromParent()
        
    }
}
