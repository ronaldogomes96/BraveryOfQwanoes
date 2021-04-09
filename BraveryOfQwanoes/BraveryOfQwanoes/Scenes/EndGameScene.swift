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
    let congratulationsNode = SKLabelNode(text: "Parabéns você concluiu uma jornada que ninguém jamais ousaria fazer !")
    let returnNode = SKLabelNode(text: "Toque na tela para retornar ao menu")
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupBackgroundNode()
        setupCongratulations()
        setupReturn()
        let userTap = UITapGestureRecognizer(target: self, action: #selector(backToMenu))
        view.addGestureRecognizer(userTap)
    }
    
    func setupBackgroundNode() {
        guard let backgroundComponent = background.component(ofType: DynamicBackgroundComponent.self)?.backgroundNode else {return}
        backgroundComponent.size.width = self.size.width
        backgroundComponent.size.height = self.size.height
        backgroundComponent.position = CGPoint(x: backgroundComponent.size.width/2, y: self.frame.midY)
        self.addChild(backgroundComponent)
    }
    
    func setupCongratulations() {
        congratulationsNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        congratulationsNode.fontSize = 30
        congratulationsNode.numberOfLines = 0
        congratulationsNode.horizontalAlignmentMode = .center
        congratulationsNode.preferredMaxLayoutWidth = 300
        congratulationsNode.fontName = "SueEllenFrancisco"
        congratulationsNode.fontColor = .white
        self.addChild(congratulationsNode)
    }
    
    func setupReturn() {
        returnNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY/2)
        returnNode.fontSize = 30
        returnNode.numberOfLines = 0
        returnNode.horizontalAlignmentMode = .center
        returnNode.preferredMaxLayoutWidth = 300
        returnNode.fontName = "SueEllenFrancisco"
        returnNode.fontColor = .white
        let shade1 = SKAction.fadeAlpha(to: 0.2, duration: 1)
        let shade2 = SKAction.fadeAlpha(to: 1, duration: 1)
        let sequence = SKAction.sequence([shade1, shade2])
        let repeatAction = SKAction.repeatForever(sequence)
        returnNode.run(repeatAction)
        self.addChild(returnNode)
    }
    
    @objc func backToMenu() {
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuController") as! MenuViewController
        
        let restartController = menuViewController

        guard
                let window = UIApplication.shared.keyWindow,
                let rootViewController = window.rootViewController
                else {
            return
        }

        restartController.view.frame = rootViewController.view.frame
        restartController.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.3, animations: {
            window.rootViewController = restartController
        })
    }
}
