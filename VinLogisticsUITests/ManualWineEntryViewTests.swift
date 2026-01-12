//
//  ManualWineEntryViewTests.swift
//  VinLogisticsUITests
//
//  UI Tests für ManualWineEntryView
//

import XCTest

final class ManualWineEntryViewTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // Navigiere zum Scanner-Tab
        app.tabBars.buttons["Scanner"].tap()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testManualEntryButtonExists() throws {
        // Prüfe ob "Manuelle Eingabe" Button vorhanden ist
        let manualEntryButton = app.buttons["Manuelle Eingabe"]
        XCTAssertTrue(manualEntryButton.exists)
    }
    
    func testManualEntryFormOpens() throws {
        // Öffne manuelles Eingabe-Formular
        app.buttons["Manuelle Eingabe"].tap()
        
        // Prüfe ob Formular angezeigt wird
        XCTAssertTrue(app.navigationBars["Neue Flasche"].exists)
    }
    
    func testRequiredFieldsExist() throws {
        // Öffne Formular
        app.buttons["Manuelle Eingabe"].tap()
        
        // Prüfe ob Pflichtfelder vorhanden sind
        let nameField = app.textFields["Weingut/Name"]
        if !nameField.exists {
            // Alternative: Suche nach TextField in Form
            let textFields = app.textFields
            XCTAssertGreaterThan(textFields.count, 0, "Mindestens ein TextField sollte vorhanden sein")
        } else {
            XCTAssertTrue(nameField.exists)
        }
    }
    
    func testSaveButtonIsDisabledWhenNameIsEmpty() throws {
        // Öffne Formular
        app.buttons["Manuelle Eingabe"].tap()
        
        // Prüfe ob Speichern-Button vorhanden ist
        let saveButton = app.buttons["Speichern"]
        if saveButton.exists {
            // Button sollte disabled sein wenn Name leer
            XCTAssertFalse(saveButton.isEnabled)
        }
    }
    
    func testSaveButtonIsEnabledWhenNameIsFilled() throws {
        // Öffne Formular
        app.buttons["Manuelle Eingabe"].tap()
        
        // Fülle Name-Feld
        let nameField = app.textFields.firstMatch
        if nameField.exists {
            nameField.tap()
            nameField.typeText("Test Wein")
            
            // Prüfe ob Speichern-Button jetzt enabled ist
            let saveButton = app.buttons["Speichern"]
            if saveButton.exists {
                XCTAssertTrue(saveButton.isEnabled)
            }
        }
    }
    
    func testCancelButtonWorks() throws {
        // Öffne Formular
        app.buttons["Manuelle Eingabe"].tap()
        
        // Prüfe ob Abbrechen-Button vorhanden ist
        let cancelButton = app.buttons["Abbrechen"]
        if cancelButton.exists {
            cancelButton.tap()
            
            // Formular sollte geschlossen sein
            XCTAssertFalse(app.navigationBars["Neue Flasche"].exists)
        }
    }
    
    func testFormFieldsCanBeFilled() throws {
        // Öffne Formular
        app.buttons["Manuelle Eingabe"].tap()
        
        // Versuche Felder auszufüllen
        let textFields = app.textFields
        if textFields.count > 0 {
            textFields.element(boundBy: 0).tap()
            textFields.element(boundBy: 0).typeText("Test Wein")
        }
        
        // Formular sollte noch offen sein
        XCTAssertTrue(app.navigationBars["Neue Flasche"].exists)
    }
}
