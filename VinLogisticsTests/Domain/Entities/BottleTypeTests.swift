//
//  BottleTypeTests.swift
//  VinLogisticsTests
//
//  Unit Tests für BottleType Enum
//

import XCTest
@testable import VinLogistics

final class BottleTypeTests: XCTestCase {
    
    // MARK: - Display Names
    
    func testDisplayName_Standard() {
        XCTAssertEqual(BottleType.standard.displayName, "Standard")
    }
    
    func testDisplayName_Magnum() {
        XCTAssertEqual(BottleType.magnum.displayName, "Magnum")
    }
    
    func testDisplayName_ThreeLiter() {
        XCTAssertEqual(BottleType.threeLiter.displayName, "3L Flasche")
    }
    
    func testDisplayName_WhiteWine() {
        XCTAssertEqual(BottleType.whiteWine.displayName, "Weisswein")
    }
    
    // MARK: - CaseIterable
    
    func testAllCases() {
        let allCases = BottleType.allCases
        XCTAssertEqual(allCases.count, 4)
        XCTAssertTrue(allCases.contains(.standard))
        XCTAssertTrue(allCases.contains(.magnum))
        XCTAssertTrue(allCases.contains(.threeLiter))
        XCTAssertTrue(allCases.contains(.whiteWine))
    }
    
    // MARK: - Codable
    
    func testCodable_Encoding() throws {
        let bottleType = BottleType.magnum
        let encoder = JSONEncoder()
        let data = try encoder.encode(bottleType)
        let jsonString = String(data: data, encoding: .utf8)
        
        XCTAssertNotNil(jsonString)
        XCTAssertTrue(jsonString?.contains("Magnum") ?? false)
    }
    
    func testCodable_Decoding() throws {
        let json = "\"Magnum\""
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let bottleType = try decoder.decode(BottleType.self, from: data)
        
        XCTAssertEqual(bottleType, .magnum)
    }
}
