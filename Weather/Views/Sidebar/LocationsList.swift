import SwiftUI

struct LocationsList: View {
    @Binding var selectedLocation: Location?
    
    var body: some View {
        List(selection: $selectedLocation) {
            Section {
                let favouriteLocations = SampleLocations.favouriteLocations
                ForEach(favouriteLocations) { location in
                    FavouriteLocationRow(location: location)
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
    }
}

#Preview {
    @Previewable @State var selectedLocation: Location?
    LocationsList(selectedLocation: $selectedLocation)
}
