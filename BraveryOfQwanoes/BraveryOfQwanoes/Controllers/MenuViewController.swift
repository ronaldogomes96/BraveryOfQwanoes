//
//  ViewController.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 12/03/21.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var configurationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGeture))
        view.addGestureRecognizer(tap)
    }

    @objc func tapGeture() {
        // do something here
        print("Tap to game")
    }
}
