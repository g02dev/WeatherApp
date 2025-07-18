import SwiftUI
import SwiftData

struct LocationDetailsView: View {
    let location: Location
    
    @Environment(\.modelContext) private var modelContext
    @State private var favoriteLocation: FavoriteLocation?
    
    private var isFavorite: Bool {
        favoriteLocation != nil
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button {
                    handleHeartButtonTap()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(isFavorite ? .pink : .secondary)
                        .font(.title)
                }
            }
            
            LocationDetailsContainer {
                CurrentWeatherSection(location: location)
                WeatherForecastSection(location: location)
            }
        }
        .padding()
        .onChange(of: location, initial: true) {
            favoriteLocation = fetchFavouriteLocation()
        }
    }
    
    private func handleHeartButtonTap() {
        if let existingFavoriteLocation = fetchFavouriteLocation() {
            modelContext.delete(existingFavoriteLocation)
            favoriteLocation = nil
        } else {
            let newFavoriteLocation = FavoriteLocation(location)
            favoriteLocation = newFavoriteLocation
            modelContext.insert(newFavoriteLocation)
        }
    }
    
    private func fetchFavouriteLocation() -> FavoriteLocation? {
        let latitude = location.latitude
        let longitude = location.longitude
        let fetchDescriptor = FetchDescriptor<FavoriteLocation>(
            predicate: #Predicate {
                $0.latitude == latitude && $0.longitude == longitude
            }
        )
        let favoriteLocations = try? modelContext.fetch(fetchDescriptor)
        return favoriteLocations?.first
    }
}

#Preview(traits: .modifier(SampleWeatherProvider())) {
    let location = SampleLocations.newYork.location
    LocationDetailsView(location: location)
}
