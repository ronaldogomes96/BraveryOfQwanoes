//
//  SecondPuzzle.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 06/04/21.
//

import Foundation
import GameplayKit

class SecondPuzzle: GKEntity {

    override init() {
        super.init()
        self.addComponent(SwipeComponent())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
