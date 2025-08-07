import SwiftUI

extension View {
    func locationsSearch(selectedLocation: Binding<Location?>) -> some View {
        modifier(LocationsSearchModifier(selectedLocation: selectedLocation))
    }
}

private struct LocationsSearchModifier: ViewModifier {
    @Binding var selectedLocation: Location?
    
    @Environment(WeatherProvider.self) private var weatherProvider

    @State private var searchText: String = ""
    @State private var foundLocations: [Location] = []

    func body(content: Content) -> some View {
        content
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search for a city"
            )
            .searchSuggestions {
                ForEach(foundLocations) { location in
                    Button {
                        selectedLocation = location
                        searchText = ""
                    } label: {
                        Text(location.searchDisplayName)
                    }
                    .foregroundStyle(.primary)
                }
            }
            .task(id: searchText) {
                guard !searchText.isEmpty else {
                    foundLocations = []
                    return
                }
                
                try? await Task.sleep(for: .seconds(0.6))
                
                guard !Task.isCancelled else { return }
                
                let newFoundLocations = await weatherProvider.locationsByName(
                    query: searchText
                )
                
                guard !Task.isCancelled else { return }
                
                foundLocations = newFoundLocations
            }
    }
}
