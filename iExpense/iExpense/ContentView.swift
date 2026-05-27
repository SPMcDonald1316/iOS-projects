//
//  ContentView.swift
//  iExpense
//
//  Created by Sean McDonald on 3/25/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
        NavigationStack {
            List {
                    ForEach(expenses) {expense in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .font(.headline)
                                    Text(expense.type)
                                }
                                
                                Spacer()
                                Text(
                                    expense.amount,
                                    format: .currency(
                                        code: Locale.current.currency?.identifier ?? "USD"
                                    )
                                )
                            }
                    }
                    .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add Expense") {
                        AddView()
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    ContentView()
}
