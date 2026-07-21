//
//  Location.swift
//  BucketList
//
//  Created by Sean McDonald on 7/21/26.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
