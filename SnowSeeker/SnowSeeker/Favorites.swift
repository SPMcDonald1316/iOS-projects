//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Sean McDonald on 8/30/26.
//

import SwiftUI

@Observable
class Favorites {
    // the resorts the user has favorited
    private var resorts: Set<String>
    
    // the key to read/write in UserDefaults
    private let key = "Favorites"
    
    init() {
        if let resortsArray = UserDefaults.standard.array(forKey: key) as? [String] {
            resorts = Set(resortsArray)
        } else {
            resorts = []
        }
    }
    
    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set and saves the change
    func add (_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from our set and saves the change
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        let resortsArray = Array(resorts)
        UserDefaults.standard.set(resortsArray, forKey: key)
    }
}
