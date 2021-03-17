//
//  DialogsComponentTests.swift
//  BraveryOfQwanoesTests
//
//  Created by Ronaldo Gomes on 17/03/21.
//

import XCTest
@testable import BraveryOfQwanoes

class DialogsComponentTests: XCTestCase {

    func test_DialogsComponentInit_partOne_returnsPuzzle() {
        //Given
        let sut = DialogsComponent(jsonName: "PartOne")
        
        //When
        let puzzle = sut.history.puzzle
        
        //Then
        XCTAssertEqual(puzzle, "Pressão e Vapor ocultos podem te surpreender, do subterrâneo a superfície imite para sobreviver.")
    }
    
    func test_DialogsComponentInit_invalidName_returnsEmpty() {
        //Given
        let sut = DialogsComponent(jsonName: "Invalid")
        
        //When
        let historyEmpty = sut.history.history
        
        //Then
        XCTAssertEqual(historyEmpty, "")
    }
    
    func test_historyInParts_PartOne_returnsThreeParts() {
        //Given
        let sut = DialogsComponent(jsonName: "PartOne")
        
        //When
        let history = sut.historyInParts()
        
        //Then
        XCTAssertEqual(history.count, 3)
    }
}
