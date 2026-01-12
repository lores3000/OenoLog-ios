//
//  LocationTests.swift
//  VinLogisticsTests
//
//  Unit Tests für Location Enum
//

import XCTest
@testable import VinLogistics

final class LocationTests: XCTestCase {
    
    // MARK: - Display Names
    
    func testDisplayName_Cellar() {
        XCTAssertEqual(Location.cellar.displayName, "Keller")
    }
    
    func testDisplayName_Apartment() {
        XCTAssertEqual(Location.apartment.displayName, "Wohnung")
    }
    
    // MARK: - CSV Konvertierung
    
    func testCSVValue_Cellar() {
        XCTAssertEqual(Location.cellar.csvValue, "Ja")
    }
    
    func testCSVValue_Apartment() {
        XCTAssertEqual(Location.apartment.csvValue, "Oben")
    }
    
    func testFromCSV_Cellar() {
        XCTAssertEqual(Location.fromCSV("Ja"), .cellar)
        XCTAssertEqual(Location.fromCSV("ja"), .cellar)
        XCTAssertEqual(Location.fromCSV("JA"), .cellar)
    }
    
    func testFromCSV_Apartment() {
        XCTAssertEqual(Location.fromCSV("Oben"), .apartment)
        XCTAssertEqual(Location.fromCSV("oben"), .apartment)
        XCTAssertEqual(Location.fromCSV("OBEN"), .apartment)
    }
    
    func testFromCSV_InvalidValue() {
        XCTAssertNil(Location.fromCSV("Invalid"))
        XCTAssertNil(Location.fromCSV(""))
        XCTAssertNil(Location.fromCSV("Keller"))
    }
    
    // MARK: - CaseIterable
    
    func testAllCases() {
        let allCases = Location.allCases
        XCTAssertEqual(allCases.count, 2)
        XCTAssertTrue(allCases.contains(.cellar))
        XCTAssertTrue(allCases.contains(.apartment))
    }
}
