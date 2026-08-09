//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Sean McDonald on 8/8/26.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    enum FilterType {
        case none, contacted, uncontacted
    }
    let filter: FilterType
    
    var title: String {
        switch filter {
            case .none:
                "Everyone"
            case .contacted:
                "Contacted people"
            case .uncontacted:
                "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(
                            name: "Paul Hudson",
                            emailAddress: "paul@hackingwithswift.com",
                            isContacted: false
                        )
                        modelContext.insert(prospect)
                    }
                }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
