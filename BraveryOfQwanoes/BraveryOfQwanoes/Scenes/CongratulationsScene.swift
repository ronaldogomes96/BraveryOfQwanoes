//
//  CongratulationsScene.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 20/04/21.
//

import UIKit
import SpriteKit

class CongratulationsScene: SKScene {
    
    private var background: Background
    private var character: Character
    private var ballon: Balloon
    
    init(backgroundName: String, characterName: String, ballonName: String) {
        self.background = Background(name: backgroundName)
        self.character = Character(characterSpriteName: characterName)
        self.ballon = Balloon(ballonSpriteName: ballonName)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
}
