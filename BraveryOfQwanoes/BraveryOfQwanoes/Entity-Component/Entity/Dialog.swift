//
//  Dialog.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit

class Dialog: GKEntity {
    
    init(historyPart: String) {
        super.init()
        self.addComponent(DialogsComponent(jsonName: historyPart))
        self.addComponent(DialogSpriteComponent())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
