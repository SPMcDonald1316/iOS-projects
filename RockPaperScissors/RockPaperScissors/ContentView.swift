//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sean McDonald on 2/11/26.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]
    @State private var roundNumber: Int = 1
    @State private var userScore: Int = 0
    @State private var cpuScore: Int = 0
    
    var body: some View {
        NavigationStack {
            Text("Round \(roundNumber)")
                .font(.largeTitle.bold())
            VStack {
                HStack {
                    VStack {
                        Image("User Choice")
                            .frame(width: 190, height: 190)
                            .background(Color.blue)
                        Text("Score: \(userScore)")
                            .font(.largeTitle)
                    }
                    VStack {
                        Image("CPU Choice")
                            .frame(width: 190, height: 190)
                            .background(.red)
                        Text("Score: \(cpuScore)")
                            .font(.largeTitle)
                    }
                }
                .padding(25)
                
                ForEach(options, id: \.self) {
                    Button($0) { }
                        .frame(width: 390, height: 50)
                        .background(.secondary)
                        .font(.largeTitle)
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

/*
 Rock, Paper, Scissors Game
 - Get images for all three options
 - Layout
    - Title display Round <Round Number>:
    - Two dashed squares with text inside User / CPU
    - Score for each below the square
    - Three buttons below with choices Rock, Paper, Scissors
 - When user makes choice:
    - Their dashed square replaced with image for their choice
    - CPU picks random choice, and cpu square replaced with image of their choice
    - Make winner decision or tie, update appropriate score
 */
