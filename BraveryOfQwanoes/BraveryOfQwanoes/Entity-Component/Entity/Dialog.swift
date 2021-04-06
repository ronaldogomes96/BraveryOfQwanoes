//
//  Dialog.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit
import UIKit

class Dialog: GKEntity {
    
    init(historyPart: String, color: UIColor) {
        super.init()
        self.addComponent(DialogsComponent(jsonName: historyPart))
        self.addComponent(DialogSpriteComponent(color: color))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
