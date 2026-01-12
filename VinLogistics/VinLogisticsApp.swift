//
//  VinLogisticsApp.swift
//  VinLogistics
//
//  Created on 2024
//

import SwiftUI
import SwiftData

@main
struct VinLogisticsApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: [])
    }
}

