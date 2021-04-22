//
//  TalkBalloon.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 21/04/21.
//

import Foundation
import GameplayKit

class TalkBalloon: GKEntity {

    init(talkBallonName: String) {
        super.init()
        self.addComponent(PlayerControlComponent(characterName: talkBallonName))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
