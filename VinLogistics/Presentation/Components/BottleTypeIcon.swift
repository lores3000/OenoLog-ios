//
//  BottleTypeIcon.swift
//  VinLogistics
//
//  Icon-Komponente für Flaschen-Typ
//

import SwiftUI

struct BottleTypeIcon: View {
    let type: BottleType
    
    var body: some View {
        Image(systemName: iconName)
            .font(.caption)
            .foregroundColor(.secondary)
    }
    
    private var iconName: String {
        switch type {
        case .standard:
            return "bottle.fill"
        case .magnum:
            return "bottle.fill.badge.plus"
        case .threeLiter:
            return "bottle.fill.badge.checkmark"
        case .whiteWine:
            return "drop.fill"
        }
    }
}

#Preview {
    HStack(spacing: 16) {
        BottleTypeIcon(type: .standard)
        BottleTypeIcon(type: .magnum)
        BottleTypeIcon(type: .threeLiter)
        BottleTypeIcon(type: .whiteWine)
    }
    .padding()
}
