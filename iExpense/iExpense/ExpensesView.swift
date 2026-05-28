//
//  ExpensesView.swift
//  iExpense
//
//  Created by Sean McDonald on 5/27/26.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
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
    }
    
    init(expenseFilter: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
            expense.type == expenseFilter || expenseFilter == "All"
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    ExpensesView(expenseFilter: "All",sortOrder: [SortDescriptor(\ExpenseItem.name)])
}
