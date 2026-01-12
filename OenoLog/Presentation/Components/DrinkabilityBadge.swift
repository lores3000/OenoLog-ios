//
//  DrinkabilityBadge.swift
//  OenoLog
//
//  Badge-Komponente für Trinkreife-Anzeige
//

import SwiftUI

struct DrinkabilityBadge: View {
    let from: Int?
    let to: Int?
    let average: Double?
    let showAverage: Bool
    
    init(
        from: Int?,
        to: Int?,
        average: Double? = nil,
        showAverage: Bool = false
    ) {
        self.from = from
        self.to = to
        self.average = average ?? (from != nil && to != nil ? Double(from! + to!) / 2.0 : nil)
        self.showAverage = showAverage
    }
    
    var body: some View {
        if let from = from, let to = to {
            HStack(spacing: 4) {
                Text("\(from)-\(to)")
                    .font(.caption)
                    .fontWeight(.semibold)
                
                if showAverage, let average = average {
                    Text("(Ø \(Int(average)))")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, .spacingS)
            .padding(.vertical, 4)
            .background(drinkabilityColor.opacity(0.2))
            .foregroundColor(drinkabilityColor)
            .cornerRadius(.cornerRadiusSmall)
        }
    }
    
    private var drinkabilityColor: Color {
        guard let from = from else { return .secondary }
        let currentYear = Calendar.current.component(.year, from: Date())
        
        if from <= currentYear {
            return .drinkabilityReady
        } else if from <= currentYear + 2 {
            return .drinkabilitySoon
        } else {
            return .drinkabilityNotReady
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        DrinkabilityBadge(from: 2020, to: 2026, showAverage: true)
        DrinkabilityBadge(from: 2025, to: 2029, showAverage: false)
        DrinkabilityBadge(from: 2022, to: 2024, showAverage: true)
    }
    .padding()
}
