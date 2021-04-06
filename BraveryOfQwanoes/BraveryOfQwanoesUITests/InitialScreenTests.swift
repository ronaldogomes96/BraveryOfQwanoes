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
}
