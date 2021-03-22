//
//  Background.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit

class Background: GKEntity {
    
    init(name: String) {
        super.init()
        self.addComponent(DynamicBackgroundComponent(backgroundName: name))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
