//
//  CharacterBoat.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit

class CharacterBoat: GKEntity {
    
    init(characterName: String) {
        super.init()
        self.addComponent(PlayerControlComponent(characterName: characterName))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
