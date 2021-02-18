//
//  ContentView.swift
//  SearchPlaces
//
//  Created by Peter Wu on 2/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationSearchService: LocationSearchService
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $locationSearchService.searchQuery)
                List(locationSearchService.completions) { completion in
                    NavigationLink(
                        destination: SearchResultView(completion: completion),
                        label: {
                            
                            VStack(alignment: .leading) {
                                Text(completion.title)
                                Text(completion.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        })
                }
                .navigationTitle(Text("Search near me"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(locationSearchService: LocationSearchService())
    }
}
