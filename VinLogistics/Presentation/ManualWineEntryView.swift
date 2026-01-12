//
//  ManualWineEntryView.swift
//  VinLogistics
//
//  Minimales Formular für manuelle Flaschen-Erfassung
//

import SwiftUI

struct ManualWineEntryView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var vintage = Calendar.current.component(.year, from: Date())
    @State private var quantity = 1
    @State private var bottleType: BottleType = .standard
    @State private var location: Location = .cellar
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Pflichtfelder") {
                    TextField("Weingut/Name", text: $name)
                    
                    Stepper("Jahrgang: \(vintage)", value: $vintage, in: 1900...2100)
                    
                    Stepper("Anzahl: \(quantity)", value: $quantity, in: 1...100)
                    
                    Picker("Flaschen-Typ", selection: $bottleType) {
                        ForEach(BottleType.allCases, id: \.self) { type in
                            Text(type.displayName).tag(type)
                        }
                    }
                    
                    Picker("Lagerort", selection: $location) {
                        ForEach(Location.allCases, id: \.self) { loc in
                            Text(loc.displayName).tag(loc)
                        }
                    }
                }
            }
            .navigationTitle("Neue Flasche")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        // TODO: Save wine
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

#Preview {
    ManualWineEntryView()
}
