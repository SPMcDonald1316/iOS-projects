//
//  ContentView.swift
//  Moonshot
//
//  Created by Sean McDonald on 4/2/26.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(String(astronauts.count))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
