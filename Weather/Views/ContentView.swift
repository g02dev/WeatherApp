import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var foundLocations: [Location] = []
    
    @State private var selectedLocation: Location?
    
    var body: some View {
        NavigationSplitView {
            Group {
                if searchText.isEmpty {
                    LocationsList(selectedLocation: $selectedLocation)
                } else {
                    LocationsSearchResultsList(
                        results: foundLocations,
                        selectedResult: $selectedLocation
                    )
                }
            }
            .navigationTitle("Weather")
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                if searchText.isEmpty {
                    foundLocations = []
                } else {
                    foundLocations = SampleLocations.foundLocations(
                        query: searchText
                    )
                }
            }
            .onChange(of: selectedLocation) {
                if selectedLocation != nil && !searchText.isEmpty {
                    searchText = ""
                }
            }
        } detail: {
            if let selectedLocation {
                LocationDetailsView(location: selectedLocation)
            } else {
                Text("Select location")
            }
        }
    }
}

#Preview(traits: .modifier(SampleWeatherProvider())) {
    ContentView()
}
