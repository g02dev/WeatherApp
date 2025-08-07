import SwiftUI

struct FavoriteLocationRow: View {
    let location: Location
    
    @Environment(WeatherProvider.self) private var weatherProvider
    
    @State private var currentWeather: Weather?
    
    var body: some View {
        HStack {
            leadingLocationInfo
            Spacer()
            trailingWeatherInfo
        }
        .task(id: location) {
            currentWeather = await weatherProvider.currentWeather(for: location)
        }
    }
    
    @ViewBuilder
    private var leadingLocationInfo: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.headline)

            let dateString = currentWeather.map { weather in
                DateFormatting.shortLocalTime(
                    date: weather.timestamp,
                    timeZone: weather.timezone
                )
            }
            Text(dateString ?? "")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    @ViewBuilder
    private var trailingWeatherInfo: some View {
        let temperature = currentWeather?.temperature ?? 0
        let weatherCondition = currentWeather?.condition ?? .unknown
        
        VStack {
            VStack {
                HStack {
                    Text("\(temperature)°")
                    Image(systemName: weatherCondition.systemImageName)
                        .systemImagePalette(weatherCondition.systemImagePalette)
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                
                Text(weatherCondition.displayName)
                    .font(.caption)
            }
        }
        .opacity(currentWeather == nil ? 0 : 1)
    }
}

#Preview("Known weather", traits: .modifier(SampleWeatherProvider())) {
    List {
        FavoriteLocationRow(location: SampleLocations.newYork.location)
    }
}

#Preview("Unknown weather", traits: .modifier(SampleWeatherProvider())) {
    List {
        FavoriteLocationRow(location: SampleLocations.unknown.location)
    }
}
