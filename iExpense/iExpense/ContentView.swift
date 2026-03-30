//
//  ContentView.swift
//  iExpense
//
//  Created by Sean McDonald on 3/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal Expenses") {
                    ForEach(expenses.personalItems) {item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, in: expenses.personalItems)
                    }
                }
                
                Section("Business Expenses") {
                    ForEach(expenses.businessItems) {item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, in: expenses.businessItems)
                    }
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                   showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet, in filteredArray: [ExpenseItem]) {
        for index in offsets {
            expenses.items.removeAll(where: {$0.id == filteredArray[index].id})
        }
    }
}

#Preview {
    ContentView()
}
