//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Sean McDonald on 7/28/26.
//

import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        var locations = [Location]()
        var selectedPlace: Location?
    }
}
