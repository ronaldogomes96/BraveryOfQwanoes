//
//  HistoryData.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 16/03/21.
//

import Foundation

class HistoryData {
    
    private let jsonName: String
    
    init(named: String) {
        jsonName = named
    }

    func getHistoryAndPuzzleData() -> History? {
        do {
            guard let bundlePath = Bundle.main.path(forResource: jsonName, ofType: "json"),
                  let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) else {
                        return nil
            }
            let decodedData = try JSONDecoder().decode(History.self, from: jsonData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
