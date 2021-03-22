//
//  FirstPuzzle.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 22/03/21.
//

import Foundation
import GameplayKit

class FirstPuzzle: GKEntity {

    override init() {
        super.init()
        self.addComponent(SensorialComponent())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
