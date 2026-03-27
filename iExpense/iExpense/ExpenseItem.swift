//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sean McDonald on 3/25/26.
//
import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
