//
//  Wine.swift
//  VinLogistics
//
//  Domain: Wine Entity
//

import Foundation

struct Wine: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var vintage: Int
    var quantity: Int
    var bottleType: BottleType
    var location: Location
    var status: WineStatus
    var drinkabilityFrom: Int?
    var drinkabilityTo: Int?
    var country: String?
    var region: String?
    var purchasedFrom: String?
    var listPrice: Decimal?
    var purchasePrice: Decimal?
    var notes: String?
    var tasting: String?
    var grapes: String?
    
    init(
        id: UUID = UUID(),
        name: String,
        vintage: Int,
        quantity: Int = 1,
        bottleType: BottleType = .standard,
        location: Location = .cellar,
        status: WineStatus = .inStock,
        drinkabilityFrom: Int? = nil,
        drinkabilityTo: Int? = nil,
        country: String? = nil,
        region: String? = nil,
        purchasedFrom: String? = nil,
        listPrice: Decimal? = nil,
        purchasePrice: Decimal? = nil,
        notes: String? = nil,
        tasting: String? = nil,
        grapes: String? = nil
    ) {
        self.id = id
        self.name = name
        self.vintage = vintage
        self.quantity = quantity
        self.bottleType = bottleType
        self.location = location
        self.status = status
        self.drinkabilityFrom = drinkabilityFrom
        self.drinkabilityTo = drinkabilityTo
        self.country = country
        self.region = region
        self.purchasedFrom = purchasedFrom
        self.listPrice = listPrice
        self.purchasePrice = purchasePrice
        self.notes = notes
        self.tasting = tasting
        self.grapes = grapes
    }
}

// MARK: - Berechnete Eigenschaften

extension Wine {
    /// Berechnet die mittlere Trinkreife
    var averageDrinkability: Double? {
        guard let from = drinkabilityFrom, let to = drinkabilityTo else {
            return nil
        }
        return Double(from + to) / 2.0
    }
    
    /// Prüft ob der Wein jetzt trinkreif ist
    var isDrinkableNow: Bool {
        guard let from = drinkabilityFrom else {
            return false
        }
        let currentYear = Calendar.current.component(.year, from: Date())
        return from <= currentYear
    }
    
    /// Formatiert die Trinkreife als String
    var drinkabilityRange: String {
        guard let from = drinkabilityFrom, let to = drinkabilityTo else {
            return ""
        }
        return "\(from)-\(to)"
    }
    
    /// Formatiert die Trinkreife mit Durchschnitt
    var drinkabilityRangeWithAverage: String {
        guard let from = drinkabilityFrom, let to = drinkabilityTo else {
            return ""
        }
        if let average = averageDrinkability {
            return "\(from)-\(to) (Ø \(Int(average)))"
        }
        return "\(from)-\(to)"
    }
    
    /// Vollständiger Anzeigename (Name + Jahrgang)
    var displayName: String {
        return "\(name) \(vintage)"
    }
}
