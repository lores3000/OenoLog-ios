//
//  LocationBadge.swift
//  VinLogistics
//
//  Badge-Komponente für Lagerort-Anzeige
//

import SwiftUI

struct LocationBadge: View {
    let location: Location
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.caption)
            Text(locationText)
                .font(.caption)
                .fontWeight(.medium)
        }
        .padding(.horizontal, .spacingS)
        .padding(.vertical, 4)
        .background(backgroundColor.opacity(0.2))
        .foregroundColor(backgroundColor)
        .cornerRadius(.cornerRadiusSmall)
    }
    
    private var iconName: String {
        switch location {
        case .cellar:
            return "building.2.fill"
        case .apartment:
            return "house.fill"
        }
    }
    
    private var locationText: String {
        switch location {
        case .cellar:
            return "Keller"
        case .apartment:
            return "Wohnung"
        }
    }
    
    private var backgroundColor: Color {
        switch location {
        case .cellar:
            return .locationCellar
        case .apartment:
            return .locationApartment
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        LocationBadge(location: .cellar)
        LocationBadge(location: .apartment)
    }
    .padding()
}
