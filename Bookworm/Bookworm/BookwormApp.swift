//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Sean McDonald on 5/14/26.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
