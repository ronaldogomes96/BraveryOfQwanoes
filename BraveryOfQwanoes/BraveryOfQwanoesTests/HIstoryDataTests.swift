//
//  HIstoryDataTests.swift
//  BraveryOfQwanoesTests
//
//  Created by Ronaldo Gomes on 16/03/21.
//

import XCTest
@testable import BraveryOfQwanoes

class HIstoryDataTests: XCTestCase {

    func test_getHistoryAndPuzzleData_PartOne_returnsHistoryAndPuzzlesStrings() {
        
        //Given
        let sut = HistoryData(named: "PartOne")
        
        //When
        let historyAndPuzzle = sut.getHistoryAndPuzzleData()
        let answer = historyAndPuzzles()
        
        //Then
        XCTAssertEqual(historyAndPuzzle?.history, answer[0])
        XCTAssertEqual(historyAndPuzzle?.puzzle, answer[1])
        
    }
    
    func test_getHistoryAndPuzzleData_InvalidName_returnsNil() {
        
        //Given
        let sut = HistoryData(named: "InvalidName")
        
        //When
        let historyAndPuzzle = sut.getHistoryAndPuzzleData()
        
        //Then
        XCTAssertNil(historyAndPuzzle)
    }
    
    // Help function
    private func historyAndPuzzles() -> [String] {
        return ["Poucos mundos em todo o universo tem uma beleza tão rara e perigosa quanto a de Encélado,Qwanoes terá que enfrentar um mar de Gelo que nenhum humano jamais ousou alcançar,Mas seu primeiro desafio será muito mais fervente do que ele poderia imaginar...", "Pressão e Vapor ocultos podem te surpreender, do subterrâneo a superfície imite para sobreviver."]
    }
}
