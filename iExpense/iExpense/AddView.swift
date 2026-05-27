//
//  AddView.swift
//  iExpense
//
//  Created by Sean McDonald on 3/25/26.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    
    let types = ["Business", "Personal"]
    
    var body: some View {
        Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
}

#Preview {
    AddView()
}
