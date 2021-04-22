//
//  GameViewController.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    let skView: SKView = SKView()
    var isPaused: Bool = false
    
    var menuControllerReference: MenuViewController?

    override func loadView() {
        super.loadView()
        self.view = skView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene: SKScene = TutorialScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .aspectFill
        menuControllerReference?.stopSound()
        self.skView.presentScene(scene)
        configLongPress()
    }
    
    @objc func longPressActivated(sender: UILongPressGestureRecognizer) {
        if !isPaused {
            guard sender.state == .began else { return }
            for vibration in 0...10 {
                if vibration % 2 == 0 {
                    if #available(iOS 10.0, *) {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                       }
                } else {
                    if #available(iOS 10.0, *) {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                       }
                }
            }
            skView.scene?.isPaused = true
            self.isPaused = true
            if let scene = skView.scene as? PauseGame {
                scene.pause()
                swipeConfig()
            }
        }
    }
    
    func configLongPress() {
        let longgesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressActivated))
        longgesture.minimumPressDuration = 0.7
        self.view.addGestureRecognizer(longgesture)
    }
    
    func swipeConfig() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(responseToGestureSwipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(responseToGestureSwipe))
        swipeUP.direction = .up
            self.view.addGestureRecognizer(swipeUP)
        
    }
    
    @objc func responseToGestureSwipe(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {            
                switch swipeGesture.direction {
                    case .right:
                        self.skView.scene?.isPaused = false
                        if let scene = skView.scene as? PauseGame {
                            scene.deleteNode(withName: "PauseNode")
                            scene.play()
                        }
                        removeGestures()
                        isPaused = false
                    case .up:
                        removeGestures()
                        restartApplication()
                        isPaused = false
                    default:
                        break
                }
            }
        }
    }
    
    func restartApplication () {
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
    
    func removeGestures() {
        for gesture in self.view.gestureRecognizers! {
            if let gesture = gesture as? UISwipeGestureRecognizer {
                self.view.removeGestureRecognizer(gesture)
            }
        }
    }
}
