//
//  SearchPlacesApp.swift
//  SearchPlaces
//
//  Created by Peter Wu on 2/17/21.
//

import SwiftUI

@main
struct SearchPlacesApp: App {
    
    @StateObject var locationSearchService = LocationSearchService()
    var body: some Scene {
        WindowGroup {
            ContentView(locationSearchService: locationSearchService)
        }
    }
}
