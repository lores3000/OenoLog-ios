//
//  MainTabView.swift
//  OenoLog
//
//  Haupt-Tab-Bar Navigation
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OverviewView()
                .tabItem {
                    Label("Übersicht", systemImage: "list.bullet")
                }
                .tag(0)
            
            ScannerView()
                .tabItem {
                    Label("Scanner", systemImage: "camera.fill")
                }
                .tag(1)
            
            InventoryView()
                .tabItem {
                    Label("Inventur", systemImage: "checklist")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gearshape.fill")
                }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
