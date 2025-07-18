import SwiftUI

struct LocationsSearchResultsList: View {
    let results: [Location]
    @Binding var selectedResult: Location?
    
    var body: some View {
        List(selection: $selectedResult) {
            ForEach(results) { location in
                Text(location.searchDisplayName)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    @Previewable @State var selectedResult: Location? = nil
    let results = SampleLocations.allLocations
    
    LocationsSearchResultsList(
        results: results,
        selectedResult: $selectedResult
    )
}
