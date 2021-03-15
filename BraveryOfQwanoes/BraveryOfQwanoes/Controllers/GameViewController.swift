//
//  GameViewController.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    let skView: SKView = SKView(frame: UIScreen.main.bounds)

    override func loadView() {
        super.loadView()
        self.view = skView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene: SKScene = EarthScene()
        scene.scaleMode = .aspectFill
        self.skView.presentScene(scene)
    }
}
