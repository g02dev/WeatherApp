import SwiftUI

struct SidebarView: View {
    @Binding var selectedLocation: Location?
    
    var body: some View {
        FavoriteLocationsList(
            selectedLocation: $selectedLocation
        )
        .navigationTitle("Weather")
        .locationsSearch(
            selectedLocation: $selectedLocation
        )
    }
}

#Preview(traits: .modifier(SampleWeatherProvider())) {
    @Previewable @State var selectedLocation: Location?
    NavigationStack {
        SidebarView(selectedLocation: $selectedLocation)
            .modelContainer(previewModelContainer)
    }
}
