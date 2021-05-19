//
//  Toten.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit

class Toten: GKEntity {
    
    init(totenName: String) {
        super.init()
        self.addComponent(TotenComponent(totenName: totenName))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
