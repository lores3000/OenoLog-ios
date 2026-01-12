//
//  ContentView.swift
//  VinLogistics
//
//  Created on 2024
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "wineglass.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("VinLogistics")
                .font(.title)
            Text("Weinkeller-Verwaltung")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

