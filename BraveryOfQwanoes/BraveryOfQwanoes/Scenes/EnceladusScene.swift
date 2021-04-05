//
//  EnceladusScene.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import SpriteKit

class EnceladusScene: SKScene {
    
    let background = Background(name: "nome de bacnground")
    let character = CharacterBoat(characterName: "qwanoes_happy")
    var jsonNames = ["Introduction", "PartOne", "PartTwo", "PartThree", "PartFour", "PartFive"]
    var dialog = Dialog(historyPart: "PartOne")
    var dialogNodes = [SKLabelNode]()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackgroundNode()
    }
    
    
    func setupBackgroundNode() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.size.width = self.size.width * 2 // verificar esse
        backgroundComponent.size.height = self.size.height
        backgroundComponent.position = CGPoint(x: backgroundComponent.size.width/2, y: self.frame.midY) //verificar esse
        self.addChild(backgroundComponent)
    }
}
