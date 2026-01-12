//
//  WineListItem.swift
//  VinLogistics
//
//  Liste-Item-Komponente für Flaschen
//

import SwiftUI

struct WineListItem: View {
    let name: String
    let vintage: Int
    let location: Location
    let drinkabilityFrom: Int?
    let drinkabilityTo: Int?
    let drinkabilityAverage: Double?
    let quantity: Int
    let bottleType: BottleType
    let isDrinkableNow: Bool
    
    var body: some View {
        HStack(spacing: .spacingM) {
            VStack(alignment: .leading, spacing: .spacingS) {
                // Name + Jahrgang
                Text("\(name) \(vintage)")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack(spacing: .spacingM) {
                    // Lagerort
                    LocationBadge(location: location)
                    
                    // Trinkreife
                    if let from = drinkabilityFrom, let to = drinkabilityTo {
                        DrinkabilityBadge(
                            from: from,
                            to: to,
                            average: drinkabilityAverage,
                            showAverage: false
                        )
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                // Anzahl
                Text("\(quantity)x")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                // Flaschen-Typ (nur wenn abweichend)
                if bottleType != .standard {
                    BottleTypeIcon(type: bottleType)
                }
            }
        }
        .padding(.vertical, .spacingS)
        .padding(.horizontal, .spacingM)
        .background(isDrinkableNow ? Color.drinkabilityReady.opacity(0.1) : Color.clear)
        .contentShape(Rectangle())
    }
}

#Preview {
    List {
        WineListItem(
            name: "Château Meyney",
            vintage: 2014,
            location: .cellar,
            drinkabilityFrom: 2020,
            drinkabilityTo: 2026,
            drinkabilityAverage: 2023,
            quantity: 6,
            bottleType: .standard,
            isDrinkableNow: true
        )
        
        WineListItem(
            name: "Korem",
            vintage: 2017,
            location: .apartment,
            drinkabilityFrom: 2022,
            drinkabilityTo: 2025,
            drinkabilityAverage: 2023.5,
            quantity: 1,
            bottleType: .magnum,
            isDrinkableNow: false
        )
    }
    .listStyle(.insetGrouped)
}
