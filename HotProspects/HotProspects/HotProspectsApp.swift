//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Sean McDonald on 8/3/26.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
