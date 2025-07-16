import SwiftUI

struct WeatherForecastSection: View {
    let location: Location
    
    @State private var forecast: [Weather] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(forecast, id: \.self) { weather in
                    WeatherForecastCell(weather: weather)
                }
            }
        }
        .scrollIndicators(.hidden)
        .sectionTitle("5 Day Forecast")
        .task {
            forecast = SampleWeather.weatherForecast(for: location)
        }
    }
}

#Preview {
    let location = SampleLocations.newYork.location
    LocationDetailsContainer {
        WeatherForecastSection(location: location)
    }
}
