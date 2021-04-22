//
//  Balloon.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 20/04/21.
//

import Foundation
import GameplayKit

class Balloon: GKEntity {
    
    init(ballonSpriteName: String) {
        super.init()
        self.addComponent(BalloonComponent(spriteName: ballonSpriteName))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
