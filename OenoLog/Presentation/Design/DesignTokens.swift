//
//  DesignTokens.swift
//  OenoLog
//
//  Design-Tokens für das Design-System
//

import SwiftUI

// MARK: - Spacing

extension CGFloat {
    static let spacingXS: CGFloat = 4
    static let spacingS: CGFloat = 8
    static let spacingM: CGFloat = 16
    static let spacingL: CGFloat = 24
    static let spacingXL: CGFloat = 32
    static let spacingXXL: CGFloat = 48
}

// MARK: - Corner Radius

extension CGFloat {
    static let cornerRadiusSmall: CGFloat = 8
    static let cornerRadiusMedium: CGFloat = 12
    static let cornerRadiusLarge: CGFloat = 16
}

// MARK: - Colors

extension Color {
    // Trinkreife-Farben (Light Mode)
    static let drinkabilityNotReady = Color(red: 0.2, green: 0.7, blue: 0.3)
    static let drinkabilitySoon = Color(red: 1.0, green: 0.6, blue: 0.0)
    static let drinkabilityReady = Color(red: 0.9, green: 0.2, blue: 0.2)
    static let drinkabilityOverripe = Color(red: 0.5, green: 0.5, blue: 0.5)
    
    // Lagerort-Farben
    static let locationCellar = Color.blue
    static let locationApartment = Color.green
}

// MARK: - Shadows

struct ShadowStyle {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}

extension ShadowStyle {
    static let small = ShadowStyle(
        color: .black.opacity(0.1),
        radius: 2,
        x: 0,
        y: 1
    )
    
    static let medium = ShadowStyle(
        color: .black.opacity(0.15),
        radius: 4,
        x: 0,
        y: 2
    )
    
    static let large = ShadowStyle(
        color: .black.opacity(0.2),
        radius: 8,
        x: 0,
        y: 4
    )
}

// MARK: - View Modifiers

extension View {
    func wineCardStyle() -> some View {
        self
            .padding(.spacingM)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(.cornerRadiusMedium)
            .shadow(
                color: ShadowStyle.small.color,
                radius: ShadowStyle.small.radius,
                x: ShadowStyle.small.x,
                y: ShadowStyle.small.y
            )
    }
}

// MARK: - Padding Extensions

extension EdgeInsets {
    static let small = EdgeInsets(
        top: .spacingS,
        leading: .spacingS,
        bottom: .spacingS,
        trailing: .spacingS
    )
    
    static let medium = EdgeInsets(
        top: .spacingM,
        leading: .spacingM,
        bottom: .spacingM,
        trailing: .spacingM
    )
    
    static let large = EdgeInsets(
        top: .spacingL,
        leading: .spacingL,
        bottom: .spacingL,
        trailing: .spacingL
    )
}

// MARK: - View Extension für Padding

extension View {
    func padding(_ size: PaddingSize) -> some View {
        switch size {
        case .small:
            return self.padding(EdgeInsets.small)
        case .medium:
            return self.padding(EdgeInsets.medium)
        case .large:
            return self.padding(EdgeInsets.large)
        }
    }
}

enum PaddingSize {
    case small
    case medium
    case large
}
