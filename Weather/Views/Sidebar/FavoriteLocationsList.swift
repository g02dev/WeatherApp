import SwiftUI
import SwiftData

struct FavoriteLocationsList: View {
    @Binding var selectedLocation: Location?
    
    @Query(sort: \FavoriteLocation.dateCreated, order: .forward)
    private var favoriteLocations: [FavoriteLocation]
    
    var body: some View {
        List(selection: $selectedLocation) {
            Section {
                ForEach(favoriteLocations, id: \.location) { favoriteLocation in
                    FavoriteLocationRow(location: favoriteLocation.location)
                }
            } header: {
                Text("Favourites")
                    .textCase(nil)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .listRowInsets(EdgeInsets.init())
                    .padding(.vertical)
            }
        }
        .listRowSpacing(8)
        .listStyle(.insetGrouped)
        .opacity(favoriteLocations.isEmpty ? 0 : 1)
    }
}

#Preview(traits: .modifier(SampleWeatherProvider())) {
    @Previewable @State var selectedLocation: Location?
    FavoriteLocationsList(selectedLocation: $selectedLocation)
        .modelContainer(previewModelContainer)
}
