//
//  ContentView.swift
//  iExpense
//
//  Created by Sean McDonald on 3/25/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let filterOptions = ["All", "Personal", "Business"]
    @State private var filter = "All"
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesView(expenseFilter: filter, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Add Expense") {
                            AddView()
                                .navigationBarBackButtonHidden()
                        }
                    }
                    
                    ToolbarItem {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount),
                                ])
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name),
                                ])
                        }
                    }
                    
                    ToolbarItem {
                        Picker("Filter", selection: $filter) {
                            ForEach(filterOptions, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                }
        }
    }
}

#Preview {
    ContentView()
}
