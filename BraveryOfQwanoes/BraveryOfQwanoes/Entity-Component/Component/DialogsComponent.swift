//
//  DialogsComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import GameplayKit

class DialogsComponent: GKComponent {
    
    var history: History
    
    init(jsonName: String) {
        
        self.history = HistoryData(named: jsonName).getHistoryAndPuzzleData() ?? History(history: "", puzzle: "")

        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func historyInParts() -> [String.SubSequence] {
        return history.history.split(separator: ",")
    }
}
