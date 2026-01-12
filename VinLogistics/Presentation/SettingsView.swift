//
//  SettingsView.swift
//  VinLogistics
//
//  Einstellungen-Screen
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Daten") {
                    Button("CSV-Export") {
                        // TODO: Implement CSV export
                    }
                    
                    Button("CSV-Import") {
                        // TODO: Implement CSV import
                    }
                }
                
                Section("Sync") {
                    Toggle("Cloud-Sync", isOn: .constant(false))
                        .disabled(true)
                    Text("Wird in zukünftiger Version verfügbar sein")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Einstellungen")
        }
    }
}

#Preview {
    SettingsView()
}
