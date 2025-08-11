import SwiftUI

struct ContentView: View {
    @State private var selectedLocation: Location?
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selectedLocation: $selectedLocation)
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
