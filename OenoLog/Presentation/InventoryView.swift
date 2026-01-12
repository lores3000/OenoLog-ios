//
//  InventoryView.swift
//  OenoLog
//
//  Inventur-Screen mit Soll/Ist-Abgleich
//

import SwiftUI

struct InventoryView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: Implement inventory functionality
                Text("Inventur")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                
                Text("Soll/Ist-Abgleich wird implementiert")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .navigationTitle("Inventur")
        }
    }
}

#Preview {
    InventoryView()
}
