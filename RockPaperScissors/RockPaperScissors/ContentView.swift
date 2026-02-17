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
    @State private var alertResult: Bool = false
    @State private var isGameOver: Bool = false
    @State private var alertMessage: String = ""
    
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
                    .clipShape(.rect)
                }
            }
            .padding()
        }
        .alert("\(alertMessage)", isPresented: $alertResult) {
            Button("Next Round") {
                roundNumber += 1
                cpuChoice = "CPU"
                userChoice = "USER"
            }
        }
        .alert("Game Over", isPresented: $isGameOver) {
            Button("Play Again?") {
                roundNumber = 1
                cpuScore = 0
                userScore = 0
                cpuChoice = "CPU"
                userChoice = "USER"
            }
        } message: {
            if userScore > cpuScore {
                Text("User Wins! \(userScore) : \(cpuScore)")
            } else if userScore < cpuScore {
                Text("CPU Wins! \(cpuScore) : \(userScore)")
            } else {
                Text("Game Tied.")
            }
        }
    }
    
    func determineCpuChoice() {
        let randomIndex = Int.random(in: 0..<options.count)
        cpuChoice = options[randomIndex]
    }
    
    func decideWinner(_ user: String, _ cpu: String) {
        if user == cpu {
            alertMessage = "Tie"
        } else if user == "Rock" {
            if cpu == "Paper" {
                alertMessage = "CPU Wins!"
                cpuScore += 1
            } else {
                alertMessage = "User Wins!"
                userScore += 1
            }
        } else if user == "Paper" {
            if cpu == "Scissors" {
                alertMessage = "CPU Wins!"
                cpuScore += 1
            } else {
                alertMessage = "User Wins!"
                userScore += 1
            }
        } else {
            if cpu == "Rock" {
                alertMessage = "CPU Wins!"
                cpuScore += 1
            } else {
                alertMessage = "User Wins!"
                userScore += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
