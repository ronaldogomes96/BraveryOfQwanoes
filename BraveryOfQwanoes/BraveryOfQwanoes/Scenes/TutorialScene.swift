//
//  TutorialScene.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 21/04/21.
//

import Foundation
import GameplayKit
import SpriteKit

class TutorialScene: SKScene {

    var background = Background(name: "space_background")
    var character = CharacterBoat(characterName: "qwanoes_thumbsUp")
    var counterMessage = 1
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackgroundNode()
        setupCharacter()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextTutorial))
        view.addGestureRecognizer(tapGesture)
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
        characterComponent.position = CGPoint(x: self.frame.midX - characterComponent.size.width/2.5, y: self.frame.minY - characterComponent.size.height)
        let duration: Double = 1.5
        let moveCharacterUp = SKAction.moveBy(x: 0, y: characterComponent.size.height*1.5, duration: duration)
        characterComponent.run(moveCharacterUp) { [self] in
            setupBallon(order: counterMessage)
        }
        self.addChild(characterComponent)
    }
    
    func setupBallon(order: Int) {
        let talkBallon = TalkBalloon(talkBallonName: "tutorialMessage\(counterMessage)")
        counterMessage += 1
        guard let talkComponentBallon = talkBallon.component(ofType: PlayerControlComponent.self)?.playerNode else {return}
        talkComponentBallon.position = CGPoint(x: self.frame.midX, y: self.frame.midY - talkComponentBallon.size.height*0.9)
        talkComponentBallon.name = "ballon"
        let duration: Double = 1.5
        talkComponentBallon.alpha = 0
        let moveCharacterUp = SKAction.fadeAlpha(to: 1, duration: duration)
        talkComponentBallon.run(moveCharacterUp)
        self.addChild(talkComponentBallon)
    }
    
    func deleteBallon() {
        let child = self.scene?.childNode(withName: "ballon")
        let action = SKAction.fadeAlpha(to: 0, duration: 1)
        child?.run(action, completion: { [self] in
            child?.removeFromParent()
            setupBallon(order: counterMessage)
        })
    }
    
    @objc func nextTutorial() {
        switch counterMessage {
            case 2:
                deleteBallon()
            default:
                let earthScene = EarthScene(size: UIScreen.main.bounds.size)
                earthScene.scaleMode = .aspectFill
                self.view?.presentScene(earthScene)
        }
    }
}
