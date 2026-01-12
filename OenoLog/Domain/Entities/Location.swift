//
//  Location.swift
//  OenoLog
//
//  Domain: Lagerort Enum
//

import Foundation

enum Location: String, Codable, CaseIterable {
    case cellar = "Keller"
    case apartment = "Wohnung"
    
    var displayName: String {
        return rawValue
    }
    
    // CSV-Kompatibilität
    var csvValue: String {
        switch self {
        case .cellar:
            return "Ja"
        case .apartment:
            return "Oben"
        }
    }
    
    static func fromCSV(_ value: String) -> Location? {
        switch value.lowercased() {
        case "ja":
            return .cellar
        case "oben":
            return .apartment
        default:
            return nil
        }
    }
}
