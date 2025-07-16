import SwiftUI

struct LocationDetailsView: View {
    let location: Location
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button {
                    isFavorite.toggle()
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
    }
}

#Preview {
    let location = SampleLocations.newYork.location
    LocationDetailsView(location: location)
}
