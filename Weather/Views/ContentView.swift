import SwiftUI

struct ContentView: View {
    @Environment(WeatherProvider.self) var weatherProvider
    @State private var searchText: String = ""
    @State private var foundLocations: [Location] = []
    
    @State private var selectedLocation: Location?
    
    var body: some View {
        NavigationSplitView {
            Group {
                if searchText.isEmpty {
                    FavoriteLocationsList(
                        selectedLocation: $selectedLocation
                    )
                } else {
                    LocationsSearchResultsList(
                        results: foundLocations,
                        selectedResult: $selectedLocation
                    )
                }
            }
            .navigationTitle("Weather")
            .searchable(text: $searchText, prompt: "Search for a city")
            .task(id: searchText) {
                if searchText.isEmpty {
                    foundLocations = []
                } else {
                    try? await Task.sleep(for: .seconds(1))
                    
                    guard !Task.isCancelled else { return }
                    
                    let newFoundLocations = await weatherProvider.locationsByName(query: searchText)
                    
                    guard !Task.isCancelled else { return }
                    
                    foundLocations = newFoundLocations
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
        .modelContainer(previewModelContainer)
}
