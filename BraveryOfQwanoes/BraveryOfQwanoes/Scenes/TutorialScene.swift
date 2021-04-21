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
    var count = 1
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackgroundNode()
        setupCharacter()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextTutorial))
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
            setupBallon(order: count)
        }
        self.addChild(characterComponent)
    }
    
    func setupBallon(order: Int) {
        var talkBallon = TalkBalloon(talkBallonName: "message\(count+3)")
        guard let talkComponentBallon = talkBallon.component(ofType: PlayerControlComponent.self)?.playerNode else {return}
        talkComponentBallon.position = CGPoint(x: self.frame.midX, y: self.frame.midY - talkComponentBallon.size.height*0.9)
        let duration: Double = 1.5
        talkComponentBallon.alpha = 0
        let moveCharacterUp = SKAction.fadeAlpha(to: 1, duration: duration)
        talkComponentBallon.run(moveCharacterUp)
        self.addChild(talkComponentBallon)
    }
    
    @objc func nextTutorial() {
        switch count {
            case 1:
                <#code#>
            default:
                <#code#>
        }
    }
}
