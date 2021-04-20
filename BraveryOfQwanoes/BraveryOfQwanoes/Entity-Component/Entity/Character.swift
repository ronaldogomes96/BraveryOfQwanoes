//
//  CharacterEntity.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 20/04/21.
//

import Foundation
import GameplayKit

class Character: GKEntity {
    
    init(characterSpriteName: String) {
        super.init()
        self.addComponent(CharacterComponent(spriteName: characterSpriteName))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
