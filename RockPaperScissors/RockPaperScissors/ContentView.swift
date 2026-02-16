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
    @State private var cpuChoice: String = "CPU"
    @State private var userChoice: String = "USER"
    @State private var winner: String = ""
    @State private var alertResult: Bool = false
    @State private var isGameOver: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.bold())
                Text("Round \(roundNumber)")
                    .font(.title.bold())
            }
            VStack {
                HStack {
                    VStack {
                        Text(userChoice)
                            .frame(width: 190, height: 190)
                            .border(.blue)
                        Text("Score: \(userScore)")
                            .font(.largeTitle)
                    }
                    VStack {
                        Text(cpuChoice)
                            .frame(width: 190, height: 190)
                            .border(.red)
                        Text("Score: \(cpuScore)")
                            .font(.largeTitle)
                    }
                }
                .padding(25)
                
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        userChoice = option
                        determineCpuChoice()
                        decideWinner(userChoice, cpuChoice)
                        if roundNumber == 10 {
                            isGameOver = true
                        } else {
                            alertResult = true
                        }
                    }
                    .frame(width: 390, height: 50)
                    .border(.primary)
                    .foregroundStyle(.primary)
                    .font(.largeTitle)
                    .clipShape(.rect, cornerRadius: 5)
                }
            }
            .padding()
        }
    }
    
    func determineCpuChoice() {
        let randomIndex = Int.random(in: 0..<options.count)
        cpuChoice = options[randomIndex]
    }
    
    func decideWinner(_ user: String, _ cpu: String) {
        if user == cpu {
            winner = "Tie"
        } else if user == "Rock" {
            if cpu == "Paper" {
                winner = "CPU"
                cpuScore += 1
            } else {
                winner = "User"
                userScore += 1
            }
        } else if user == "Paper" {
            if cpu == "Scissors" {
                winner = "CPU"
                cpuScore += 1
            } else {
                winner = "User"
                userScore += 1
            }
        } else {
            if cpu == "Rock" {
                winner = "CPU"
                cpuScore += 1
            } else {
                winner = "User"
                userScore += 1
            }
        }
    }
}

#Preview {
    ContentView()
}

/*
 Rock, Paper, Scissors Game
 - Layout
    - Title display Round <Round Number>:
    - Two dashed border squares with text inside User / CPU
    - Score for each below the square
    - Three buttons below with choices Rock, Paper, Scissors
 - When user makes choice:
    - Their
    - CPU picks random choice, and cpu square replaced with image of their choice
    - Make winner decision or tie, update appropriate score
 */
