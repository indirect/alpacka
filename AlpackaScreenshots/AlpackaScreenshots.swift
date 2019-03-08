//
//  AlpackaScreenshots.swift
//  AlpackaScreenshots
//
//  Created by André Arko on 3/8/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import XCTest

class AlpackaScreenshots: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        snapshot("0 Launch")

        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"HawaiiJS")/*[[".cells.containing(.staticText, identifier:\"Honolulu, HI\")",".cells.containing(.staticText, identifier:\"HawaiiJS\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["5 days"].tap()

        snapshot("1 Trip")

        app.navigationBars["HawaiiJS"].buttons["Trips"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"BangBangCon West")/*[[".cells.containing(.staticText, identifier:\"Santa Cruz, CA\")",".cells.containing(.staticText, identifier:\"BangBangCon West\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["5 days"].tap()
        app.navigationBars["BangBangCon West"].buttons["Trips"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Indonesian Vacation")/*[[".cells.containing(.staticText, identifier:\"Jakarta, Indonesia\")",".cells.containing(.staticText, identifier:\"Indonesian Vacation\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["March 8"].tap()
        app.navigationBars["Indonesian Vacation"].buttons["Edit"].tap()

        snapshot("2 Edit")
    }

}
