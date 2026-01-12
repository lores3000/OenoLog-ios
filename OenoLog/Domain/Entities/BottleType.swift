//
//  BottleType.swift
//  OenoLog
//
//  Domain: Flaschen-Typ Enum
//

import Foundation

enum BottleType: String, Codable, CaseIterable {
    case standard = "Standard"
    case magnum = "Magnum"
    case threeLiter = "3L Flasche"
    case whiteWine = "Weisswein"
    
    var displayName: String {
        return rawValue
    }
}
