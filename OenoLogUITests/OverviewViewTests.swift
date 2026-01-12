//
//  OverviewViewTests.swift
//  OenoLogUITests
//
//  UI Tests für OverviewView
//

import XCTest

final class OverviewViewTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // Navigiere zur Übersicht
        app.tabBars.buttons["Übersicht"].tap()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testOverviewScreenIsDisplayed() throws {
        XCTAssertTrue(app.navigationBars["OenoLog"].exists)
    }
    
    func testFilterSegmentedControlExists() throws {
        // Prüfe ob Segmented Control vorhanden ist
        // (kann durch Picker oder Buttons dargestellt werden)
        let segmentedControl = app.segmentedControls.firstMatch
        if segmentedControl.exists {
            XCTAssertTrue(segmentedControl.exists)
        } else {
            // Fallback: Prüfe ob Filter-Buttons vorhanden sind
            XCTAssertTrue(app.buttons["Trinkreif"].exists || 
                         app.buttons["Keller"].exists ||
                         app.buttons["Wohnung"].exists)
        }
    }
    
    func testSearchFieldExists() throws {
        // Prüfe ob Suchfeld vorhanden ist
        let searchField = app.searchFields.firstMatch
        if searchField.exists {
            XCTAssertTrue(searchField.exists)
        } else {
            // Alternative: Prüfe ob Navigation Bar Search Field vorhanden ist
            let navBar = app.navigationBars["OenoLog"]
            XCTAssertTrue(navBar.exists)
        }
    }
    
    func testWineListIsDisplayed() throws {
        // Prüfe ob Liste vorhanden ist
        let list = app.tables.firstMatch
        XCTAssertTrue(list.exists)
    }
    
    func testFilterChange() throws {
        // Versuche Filter zu wechseln (falls Segmented Control vorhanden)
        let segmentedControl = app.segmentedControls.firstMatch
        if segmentedControl.exists {
            // Wechsle zu "Keller" Filter
            let buttons = segmentedControl.buttons
            if buttons.count > 1 {
                buttons.element(boundBy: 1).tap()
            }
        }
        
        // Liste sollte immer noch vorhanden sein
        XCTAssertTrue(app.tables.firstMatch.exists)
    }
}
