//
//  DeliveryFromLocalsUITests.swift
//  DeliveryFromLocalsUITests
//
//  Created by Georgij on 09.11.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import XCTest

class DeliveryFromLocalsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication() // создается прокси нашего приложения
        
        app.tables.staticTexts["Paris"].tap() // находится элемент с названием Paris и выполняется тап по этому элементу
        
        // выполняется поиск searchBar'а
        let parisNavigationBar = app.navigationBars["Paris"]
        let searchSearchField = parisNavigationBar.searchFields["Search"]
        searchSearchField.tap()
        
        // вводится строка поиска
        searchSearchField.typeText("Onion Soup")
        app.typeText("\r")
        
        // вызывается метод forceTapElement для тапа по кнопке внтури ячейки
        app.tables.cells.buttons["Buy 250$"].forceTapElement()
        
        // тап по кнопке в алерте
        app.alerts["Покупка"].buttons["Ok"].tap()
        
        // тап по Cancel
        parisNavigationBar.buttons["Cancel"].tap()
    }
}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
            coordinate.tap()
        }
    }
}
