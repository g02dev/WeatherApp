import SwiftUI

struct WeatherForecastSection: View {
    let location: Location
    
    @Environment(WeatherProvider.self) var weatherProvider
    @State private var forecast: [Weather] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(forecast, id: \.self) { weather in
                    WeatherForecastCell(weather: weather)
                }
            }
        }
        .sectionTitle("5 Day Forecast")
        .scrollIndicators(.hidden)
        .onChange(of: location, initial: true) {
            Task {
                forecast = await weatherProvider.weatherForecast(for: location)
            }
        }
    }
}

#Preview("Known weather", traits: .modifier(SampleWeatherProvider())) {
    let location = SampleLocations.newYork.location
    LocationDetailsContainer {
        WeatherForecastSection(location: location)
    }
}

#Preview("Unknown weather", traits: .modifier(SampleWeatherProvider())) {
    let location = SampleLocations.unknown.location
    LocationDetailsContainer {
        WeatherForecastSection(location: location)
    }
}
