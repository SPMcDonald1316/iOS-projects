//
//  ContentView.swift
//  Moonshot
//
//  Created by Sean McDonald on 4/2/26.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
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
