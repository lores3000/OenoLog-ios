//
//  WineStatusTests.swift
//  OenoLogTests
//
//  Unit Tests für WineStatus Enum
//

import XCTest
@testable import OenoLog

final class WineStatusTests: XCTestCase {
    
    // MARK: - Display Names
    
    func testDisplayName_InStock() {
        XCTAssertEqual(WineStatus.inStock.displayName, "Im Lager")
    }
    
    func testDisplayName_Consumed() {
        XCTAssertEqual(WineStatus.consumed.displayName, "Getrunken")
    }
    
    func testDisplayName_Depleted() {
        XCTAssertEqual(WineStatus.depleted.displayName, "Ausgetrunken")
    }
    
    func testDisplayName_SubscriptionPending() {
        XCTAssertEqual(WineStatus.subscriptionPending.displayName, "Lieferung ausstehend")
    }
    
    // MARK: - CSV Konvertierung
    
    func testCSVValue_InStock() {
        XCTAssertEqual(WineStatus.inStock.csvValue, "Ja")
    }
    
    func testCSVValue_Consumed() {
        XCTAssertEqual(WineStatus.consumed.csvValue, "Getrunken")
    }
    
    func testCSVValue_Depleted() {
        XCTAssertEqual(WineStatus.depleted.csvValue, "Ausgetrunken")
    }
    
    func testCSVValue_SubscriptionPending() {
        XCTAssertEqual(WineStatus.subscriptionPending.csvValue, "Lieferung ausstehend")
    }
    
    func testFromCSV_InStock() {
        XCTAssertEqual(WineStatus.fromCSV("Ja"), .inStock)
        XCTAssertEqual(WineStatus.fromCSV("ja"), .inStock)
        XCTAssertEqual(WineStatus.fromCSV("JA"), .inStock)
    }
    
    func testFromCSV_Consumed() {
        XCTAssertEqual(WineStatus.fromCSV("Getrunken"), .consumed)
        XCTAssertEqual(WineStatus.fromCSV("getrunken"), .consumed)
        XCTAssertEqual(WineStatus.fromCSV("GETRUNKEN"), .consumed)
    }
    
    func testFromCSV_Depleted() {
        XCTAssertEqual(WineStatus.fromCSV("Ausgetrunken"), .depleted)
        XCTAssertEqual(WineStatus.fromCSV("ausgetrunken"), .depleted)
    }
    
    func testFromCSV_SubscriptionPending() {
        XCTAssertEqual(WineStatus.fromCSV("Lieferung ausstehend"), .subscriptionPending)
        XCTAssertEqual(WineStatus.fromCSV("lieferung ausstehend"), .subscriptionPending)
    }
    
    func testFromCSV_InvalidValue() {
        XCTAssertNil(WineStatus.fromCSV("Invalid"))
        XCTAssertNil(WineStatus.fromCSV(""))
        XCTAssertNil(WineStatus.fromCSV("Im Lager"))
    }
    
    // MARK: - CaseIterable
    
    func testAllCases() {
        let allCases = WineStatus.allCases
        XCTAssertEqual(allCases.count, 4)
        XCTAssertTrue(allCases.contains(.inStock))
        XCTAssertTrue(allCases.contains(.consumed))
        XCTAssertTrue(allCases.contains(.depleted))
        XCTAssertTrue(allCases.contains(.subscriptionPending))
    }
}
