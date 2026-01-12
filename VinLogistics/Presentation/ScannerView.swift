//
//  ScannerView.swift
//  VinLogistics
//
//  Scanner-Screen mit OCR-Erkennung
//

import SwiftUI

struct ScannerView: View {
    @State private var showManualEntry = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: Implement camera view with OCR
                Text("Scanner")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                
                Text("OCR-Erkennung wird implementiert")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding()
                
                Button("Manuelle Eingabe") {
                    showManualEntry = true
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Scanner")
            .sheet(isPresented: $showManualEntry) {
                ManualWineEntryView()
            }
        }
    }
}

#Preview {
    ScannerView()
}
