//
//  OverviewView.swift
//  VinLogistics
//
//  Übersicht-Screen mit filterbaren Ansichten
//

import SwiftUI

enum OverviewFilter: String, CaseIterable {
    case drinkable = "Trinkreif"
    case cellar = "Keller"
    case apartment = "Wohnung"
    case subscriptions = "Subskriptionen"
}

struct OverviewView: View {
    @State private var selectedFilter: OverviewFilter = .drinkable
    @State private var searchText = ""
    
    // TODO: Replace with actual data source
    let sampleWines: [Wine] = [
        Wine(
            name: "Château Meyney",
            vintage: 2014,
            quantity: 6,
            location: .cellar,
            drinkabilityFrom: 2020,
            drinkabilityTo: 2026
        ),
        Wine(
            name: "Korem",
            vintage: 2017,
            quantity: 1,
            bottleType: .magnum,
            location: .apartment,
            drinkabilityFrom: 2022,
            drinkabilityTo: 2025
        )
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Filter Segmented Control
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(OverviewFilter.allCases, id: \.self) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, .spacingM)
                .padding(.vertical, .spacingS)
                
                // Wine List
                List(filteredWines) { wine in
                    WineListItem(
                        name: wine.name,
                        vintage: wine.vintage,
                        location: wine.location,
                        drinkabilityFrom: wine.drinkabilityFrom,
                        drinkabilityTo: wine.drinkabilityTo,
                        drinkabilityAverage: wine.averageDrinkability,
                        quantity: wine.quantity,
                        bottleType: wine.bottleType,
                        isDrinkableNow: wine.isDrinkableNow
                    )
                    .swipeActions(edge: .trailing) {
                        Button("Umlagern") {
                            // TODO: Implement move action
                        }
                        .tint(.blue)
                        
                        Button("Getrunken") {
                            // TODO: Implement consume action
                        }
                        .tint(.red)
                    }
                }
                .listStyle(.insetGrouped)
                .searchable(text: $searchText, prompt: "Weine suchen")
            }
            .navigationTitle("VinLogistics")
        }
    }
    
    private var filteredWines: [Wine] {
        var wines = sampleWines
        
        // Filter by selected filter
        switch selectedFilter {
        case .drinkable:
            wines = wines.filter { $0.isDrinkableNow && $0.status == .inStock }
        case .cellar:
            wines = wines.filter { $0.location == .cellar && $0.status == .inStock }
        case .apartment:
            wines = wines.filter { $0.location == .apartment && $0.status == .inStock }
        case .subscriptions:
            wines = wines.filter { $0.status == .subscriptionPending }
        }
        
        // Filter by search text
        if !searchText.isEmpty {
            wines = wines.filter { wine in
                wine.name.localizedCaseInsensitiveContains(searchText) ||
                String(wine.vintage).contains(searchText) ||
                wine.region?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
        
        return wines
    }
}

#Preview {
    OverviewView()
}
