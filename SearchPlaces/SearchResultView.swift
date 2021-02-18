//
//  SearchResult.swift
//  SearchPlaces
//
//  Created by Peter Wu on 2/17/21.
//

import SwiftUI
import MapKit

struct SearchResultView: View {
    
    var completion: MKLocalSearchCompletion
    @State var placeMarks: [MKPlacemark] = []
    
    var body: some View {
        List {
            ForEach(placeMarks, id: \.self) { placeMark in
                VStack {
                    Text("\(placeMark.locality!), \(placeMark.country!)")
                }
            }
        }
        .onAppear(perform: {
            performSearch(completion: completion)
        })
    }
    
    func performSearch(completion: MKLocalSearchCompletion) {
        let request = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            
            for item in response!.mapItems {
                placeMarks.append(item.placemark)
            }
        }
    }
}

//struct SearchResult_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
