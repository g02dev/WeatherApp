import SwiftUI

struct ContentView: View {
    @State private var selectedLocation: Location?
    
    var body: some View {
        NavigationSplitView {
            LocationsListView(selectedLocation: $selectedLocation)
                .navigationTitle("Weather")
        } detail: {
            Text(selectedLocation?.name ?? "Select a location")
        }
    }
}

#Preview {
    ContentView()
}
