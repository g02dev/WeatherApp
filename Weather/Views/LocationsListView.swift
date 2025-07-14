import SwiftUI

struct LocationsListView: View {
    @Binding var selectedLocation: Location?
    
    var body: some View {
        List(selection: $selectedLocation) {
            let favouriteLocations = SampleLocations.allLocations
            ForEach(favouriteLocations, id: \.self) { location in
                FavouriteLocationRow(location: location)
            }
        }
        .listRowSpacing(8)
        .listStyle(.insetGrouped)
    }
}

#Preview {
    @Previewable @State var selectedLocation: Location?
    LocationsListView(selectedLocation: $selectedLocation)
}
