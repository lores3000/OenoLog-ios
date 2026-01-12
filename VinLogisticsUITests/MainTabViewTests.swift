//
//  MainTabViewTests.swift
//  VinLogisticsUITests
//
//  UI Tests für MainTabView
//

import XCTest

final class MainTabViewTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testAllTabsArePresent() throws {
        // Prüfe ob alle 4 Tabs vorhanden sind
        XCTAssertTrue(app.tabBars.buttons["Übersicht"].exists)
        XCTAssertTrue(app.tabBars.buttons["Scanner"].exists)
        XCTAssertTrue(app.tabBars.buttons["Inventur"].exists)
        XCTAssertTrue(app.tabBars.buttons["Einstellungen"].exists)
    }
    
    func testTabNavigation_Overview() throws {
        let overviewTab = app.tabBars.buttons["Übersicht"]
        XCTAssertTrue(overviewTab.exists)
        overviewTab.tap()
        
        // Prüfe ob Übersicht-Screen angezeigt wird
        XCTAssertTrue(app.navigationBars["VinLogistics"].exists)
    }
    
    func testTabNavigation_Scanner() throws {
        let scannerTab = app.tabBars.buttons["Scanner"]
        XCTAssertTrue(scannerTab.exists)
        scannerTab.tap()
        
        // Prüfe ob Scanner-Screen angezeigt wird
        XCTAssertTrue(app.navigationBars["Scanner"].exists)
    }
    
    func testTabNavigation_Inventory() throws {
        let inventoryTab = app.tabBars.buttons["Inventur"]
        XCTAssertTrue(inventoryTab.exists)
        inventoryTab.tap()
        
        // Prüfe ob Inventur-Screen angezeigt wird
        XCTAssertTrue(app.navigationBars["Inventur"].exists)
    }
    
    func testTabNavigation_Settings() throws {
        let settingsTab = app.tabBars.buttons["Einstellungen"]
        XCTAssertTrue(settingsTab.exists)
        settingsTab.tap()
        
        // Prüfe ob Einstellungen-Screen angezeigt wird
        XCTAssertTrue(app.navigationBars["Einstellungen"].exists)
    }
    
    func testTabIconsAreVisible() throws {
        // Prüfe ob Tab-Icons sichtbar sind (indirekt durch Tab-Buttons)
        let tabs = app.tabBars.buttons
        XCTAssertGreaterThan(tabs.count, 0)
    }
}
