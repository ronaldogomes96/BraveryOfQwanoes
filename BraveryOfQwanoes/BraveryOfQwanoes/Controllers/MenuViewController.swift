//
//  ViewController.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 12/03/21.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var configurationButton: UIButton!
    @IBOutlet weak var startLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tap)
        startLabel.titleLabel?.font = .SueEllenFranciscoRegularTittle
    }

    @objc func tapGesture() {
        let controller = GameViewController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
}
