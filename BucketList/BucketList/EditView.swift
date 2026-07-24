//
//  EditView.swift
//  BucketList
//
//  Created by Sean McDonald on 7/24/26.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
    
    init(location: Location) {
        self.location = location
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditView(location: .example)
}
