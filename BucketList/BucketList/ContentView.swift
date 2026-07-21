//
//  ContentView.swift
//  BucketList
//
//  Created by Sean McDonald on 7/15/26.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        Map(initialPosition: startPosition)
    }
}

#Preview {
    ContentView()
}
