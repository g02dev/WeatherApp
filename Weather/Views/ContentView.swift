import SwiftUI

struct ContentView: View {
    @State private var selectedLocation: Location?
    
    var body: some View {
        NavigationSplitView {
            LocationsList(selectedLocation: $selectedLocation)
                .navigationTitle("Weather")
        } detail: {
            if let selectedLocation {
                LocationDetailsView(location: selectedLocation)
            } else {
                Text("Select a location")
            }
        }
    }
}

#Preview {
    ContentView()
}
