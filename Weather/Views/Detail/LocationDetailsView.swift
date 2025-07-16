import SwiftUI

struct LocationDetailsView: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
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
