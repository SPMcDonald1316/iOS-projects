//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Sean McDonald on 3/25/26.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ExpenseItem.self)
        }
    }
}
