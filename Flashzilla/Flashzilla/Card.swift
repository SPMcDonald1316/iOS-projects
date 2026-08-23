//
//  Card.swift
//  Flashzilla
//
//  Created by Sean McDonald on 8/16/26.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
