//
//  OenoLogApp.swift
//  OenoLog
//
//  Created on 2024
//

import SwiftUI
import SwiftData

@main
struct OenoLogApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: [])
    }
}

