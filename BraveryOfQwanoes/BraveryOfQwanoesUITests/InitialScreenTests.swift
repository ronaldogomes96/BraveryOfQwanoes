//
//  InitialScreenTests.swift
//  BraveryOfQwanoesUITests
//
//  Created by Ana Karolina Costa da Silva on 05/04/21.
//

import XCTest
@testable import BraveryOfQwanoes

class InitialScreenTests: XCTestCase {

  func test_initialScreenButtons_actionables() {
    let app = XCUIApplication()
        app.launchArguments = ["-noAnimations"]
        app.launch()

        let settings = app.buttons["settings"]
        XCTAssert(settings.isHittable)
        settings.tap()
        let close = app.buttons["close"]
        XCTAssert(close.isHittable)
  }

  func test_initialScreenTapForInit_actionable() {
    let app = XCUIApplication()
    app.launchArguments = ["-noAnimations"]
    app.launch()

    let labelTap = app.windows.element.buttons["startLabel"]
    XCTAssert(labelTap.isHittable)
    labelTap.tap()

  }

  func test_initialHistoryTapForContinue_actionables() {
    let app = XCUIApplication()
    app.launchArguments = ["-noAnimations"]
    app.launch()

    let labelTap = app.windows.element.buttons["startLabel"].tap()

    let label1 = app.otherElements["Qwanoes nunca temeu os perigos e consequências inevitáveis de suas aventuras pelo oceano"]
    XCTAssert(label1.isHittable)
    label1.tap()

    let label2 = app.otherElements["Mas para Qwanoes as desventuras da terra eram muito ínfimas"]
    XCTAssert(label2.isHittable)
    label2.tap()

    let label3 = app.otherElements["Se guiando pelas estrelas ele sempre se perguntou se seria possível alcançar os mistérios que elas guardavam"]
    XCTAssert(label3.isHittable)
    label3.tap()

    let label4 = app.otherElements["E em uma dose certa de eventos da natureza e intuição"]
    XCTAssert(label4.isHittable)
    label4.tap()

    let label5 = app.otherElements["Qwanoes seguiu uma rota além da lógica do universo"]
    XCTAssert(label5.isHittable)
    label5.tap()

    let label6 = app.otherElements["E o que ele fez em seguida foi para muitos"]
    XCTAssert(label6.isHittable)
    label6.tap()

    let label7 = app.otherElements["Um sacrifício extremo demais a se fazer para descobrir os mistérios do universo..."]
    XCTAssert(label7.isHittable)
    label7.tap()

  }

}
