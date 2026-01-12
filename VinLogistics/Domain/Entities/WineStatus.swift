//
//  WineStatus.swift
//  VinLogistics
//
//  Domain: Wein-Status Enum
//

import Foundation

enum WineStatus: String, Codable, CaseIterable {
    case inStock = "Im Lager"
    case consumed = "Getrunken"
    case depleted = "Ausgetrunken"
    case subscriptionPending = "Lieferung ausstehend"
    
    var displayName: String {
        return rawValue
    }
    
    // CSV-Kompatibilität
    var csvValue: String {
        switch self {
        case .inStock:
            return "Ja"
        case .consumed:
            return "Getrunken"
        case .depleted:
            return "Ausgetrunken"
        case .subscriptionPending:
            return "Lieferung ausstehend"
        }
    }
    
    static func fromCSV(_ value: String) -> WineStatus? {
        let lowercased = value.lowercased()
        switch lowercased {
        case "ja":
            return .inStock
        case "getrunken":
            return .consumed
        case "ausgetrunken":
            return .depleted
        case "lieferung ausstehend":
            return .subscriptionPending
        default:
            return nil
        }
    }
}
