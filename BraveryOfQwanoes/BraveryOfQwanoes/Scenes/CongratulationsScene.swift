//
//  CongratulationsScene.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 20/04/21.
//

import UIKit
import SpriteKit

class CongratulationsScene: SKScene {
    
    private var background = Background(name: "space_background")
    private var character = Character(characterSpriteName: "qwanoes_thumbsup")
    private var ballon = Balloon(ballonSpriteName: "messa_ok")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        setupBackgroundNode()
        setupCharacterNode()
        setupBallonNode()
        
        let userTap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(userTap)
    }
    
    func setupBackgroundNode() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.size.width = self.size.width
        backgroundComponent.size.height = self.size.height
        backgroundComponent.position = CGPoint(x: backgroundComponent.size.width/2, y: self.frame.midY)
        self.addChild(backgroundComponent)
    }
    
    func setupCharacterNode() {
        guard let characterComponent = character.component(ofType: CharacterComponent.self)?.characterNode else {return}
        characterComponent.size.width = 280
        characterComponent.size.height = 280
        characterComponent.position = CGPoint(x: self.frame.midX - characterComponent.size.height/3, y: self.frame.midY - self.size.width/1.35)
        self.addChild(characterComponent)
    }
    
    func setupBallonNode() {
        guard let ballonComponent = ballon.component(ofType: BalloonComponent.self)?.ballonNode else {return}
        ballonComponent.size.width = 250
        ballonComponent.size.height = 250
        ballonComponent.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(ballonComponent)
    }
    
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        let enceladusScene = EnceladusScene(size: UIScreen.main.bounds.size)
        enceladusScene.scaleMode = .aspectFill
        self.view?.presentScene(enceladusScene)
    }
}
