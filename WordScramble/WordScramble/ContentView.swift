//
//  ContentView.swift
//  WordScramble
//
//  Created by Sean McDonald on 2/24/26.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicates with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        // extra valiation to come
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        // Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(
            forResource: "start",
            withExtension: "txt"
        ) {
            // Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL
            ) {
                // Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // Pick one random word, or use "silkworm" as default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // If we are here everything has worked, so we can exit
                return
            }
        }
        
        // If we are here then there was a problem - trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
}

#Preview {
    ContentView()
}
