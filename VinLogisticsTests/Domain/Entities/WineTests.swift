//
//  WineTests.swift
//  VinLogisticsTests
//
//  Unit Tests für Wine Entity
//

import XCTest
@testable import VinLogistics

final class WineTests: XCTestCase {
    
    // MARK: - Initialisierung
    
    func testWineInitializationWithRequiredFields() {
        let wine = Wine(
            name: "Château Meyney",
            vintage: 2014
        )
        
        XCTAssertEqual(wine.name, "Château Meyney")
        XCTAssertEqual(wine.vintage, 2014)
        XCTAssertEqual(wine.quantity, 1) // Default
        XCTAssertEqual(wine.bottleType, .standard) // Default
        XCTAssertEqual(wine.location, .cellar) // Default
        XCTAssertEqual(wine.status, .inStock) // Default
    }
    
    func testWineInitializationWithAllFields() {
        let wine = Wine(
            name: "Korem",
            vintage: 2017,
            quantity: 6,
            bottleType: .magnum,
            location: .apartment,
            status: .inStock,
            drinkabilityFrom: 2022,
            drinkabilityTo: 2025,
            country: "Italien",
            region: "Sardinien",
            purchasedFrom: "Coop",
            listPrice: 30.0,
            purchasePrice: 25.0,
            notes: "Sehr gut",
            tasting: "4",
            grapes: "Carignano"
        )
        
        XCTAssertEqual(wine.name, "Korem")
        XCTAssertEqual(wine.vintage, 2017)
        XCTAssertEqual(wine.quantity, 6)
        XCTAssertEqual(wine.bottleType, .magnum)
        XCTAssertEqual(wine.location, .apartment)
        XCTAssertEqual(wine.drinkabilityFrom, 2022)
        XCTAssertEqual(wine.drinkabilityTo, 2025)
        XCTAssertEqual(wine.country, "Italien")
        XCTAssertEqual(wine.region, "Sardinien")
        XCTAssertEqual(wine.purchasedFrom, "Coop")
        XCTAssertEqual(wine.notes, "Sehr gut")
        XCTAssertEqual(wine.tasting, "4")
        XCTAssertEqual(wine.grapes, "Carignano")
    }
    
    // MARK: - Berechnete Eigenschaften
    
    func testAverageDrinkability() {
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: 2020,
            drinkabilityTo: 2026
        )
        
        XCTAssertEqual(wine.averageDrinkability, 2023.0)
    }
    
    func testAverageDrinkabilityWithNilValues() {
        let wine = Wine(
            name: "Test",
            vintage: 2014
        )
        
        XCTAssertNil(wine.averageDrinkability)
    }
    
    func testAverageDrinkabilityWithOnlyFrom() {
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: 2020
        )
        
        XCTAssertNil(wine.averageDrinkability)
    }
    
    func testIsDrinkableNow_WhenDrinkabilityFromIsPast() {
        let currentYear = Calendar.current.component(.year, from: Date())
        let pastYear = currentYear - 1
        
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: pastYear
        )
        
        XCTAssertTrue(wine.isDrinkableNow)
    }
    
    func testIsDrinkableNow_WhenDrinkabilityFromIsCurrent() {
        let currentYear = Calendar.current.component(.year, from: Date())
        
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: currentYear
        )
        
        XCTAssertTrue(wine.isDrinkableNow)
    }
    
    func testIsDrinkableNow_WhenDrinkabilityFromIsFuture() {
        let currentYear = Calendar.current.component(.year, from: Date())
        let futureYear = currentYear + 1
        
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: futureYear
        )
        
        XCTAssertFalse(wine.isDrinkableNow)
    }
    
    func testIsDrinkableNow_WhenDrinkabilityFromIsNil() {
        let wine = Wine(
            name: "Test",
            vintage: 2014
        )
        
        XCTAssertFalse(wine.isDrinkableNow)
    }
    
    // MARK: - Formatierung
    
    func testDrinkabilityRange() {
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: 2020,
            drinkabilityTo: 2026
        )
        
        XCTAssertEqual(wine.drinkabilityRange, "2020-2026")
    }
    
    func testDrinkabilityRangeWithNilValues() {
        let wine = Wine(
            name: "Test",
            vintage: 2014
        )
        
        XCTAssertEqual(wine.drinkabilityRange, "")
    }
    
    func testDrinkabilityRangeWithAverage() {
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: 2020,
            drinkabilityTo: 2026
        )
        
        XCTAssertEqual(wine.drinkabilityRangeWithAverage, "2020-2026 (Ø 2023)")
    }
    
    func testDrinkabilityRangeWithAverage_WithOddYears() {
        let wine = Wine(
            name: "Test",
            vintage: 2014,
            drinkabilityFrom: 2020,
            drinkabilityTo: 2025
        )
        
        XCTAssertEqual(wine.drinkabilityRangeWithAverage, "2020-2025 (Ø 2022)")
    }
    
    func testDisplayName() {
        let wine = Wine(
            name: "Château Meyney",
            vintage: 2014
        )
        
        XCTAssertEqual(wine.displayName, "Château Meyney 2014")
    }
    
    // MARK: - Equatable
    
    func testWineEquality() {
        let id = UUID()
        let wine1 = Wine(
            id: id,
            name: "Test",
            vintage: 2014
        )
        let wine2 = Wine(
            id: id,
            name: "Test",
            vintage: 2014
        )
        
        XCTAssertEqual(wine1, wine2)
    }
    
    func testWineInequality_DifferentIDs() {
        let wine1 = Wine(
            name: "Test",
            vintage: 2014
        )
        let wine2 = Wine(
            name: "Test",
            vintage: 2014
        )
        
        XCTAssertNotEqual(wine1, wine2) // Different UUIDs
    }
    
    func testWineInequality_DifferentNames() {
        let id = UUID()
        let wine1 = Wine(
            id: id,
            name: "Test 1",
            vintage: 2014
        )
        let wine2 = Wine(
            id: id,
            name: "Test 2",
            vintage: 2014
        )
        
        XCTAssertNotEqual(wine1, wine2)
    }
}
