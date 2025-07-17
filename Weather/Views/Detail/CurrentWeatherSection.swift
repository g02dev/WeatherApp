import SwiftUI

struct CurrentWeatherSection: View {
    let location: Location
    
    @Environment(WeatherProvider.self) var weatherProvider
    @State private var weather: Weather?
    
    @ScaledMetric private var fontSize: CGFloat = 70
    @ScaledMetric private var imageSize: CGFloat = 150
    
    var body: some View {
        VStack {
            let weatherCondition = weather?.condition ?? .unknown
            Image(systemName: weatherCondition.systemImageName)
                .resizable()
                .scaledToFit()
                .systemImagePalette(weatherCondition.systemImagePalette)
                .frame(width: imageSize, height: imageSize)
            Text("\(weather?.temperature ?? 0)°")
        }
        .opacity(weather == nil ? 0 : 1)
        .sectionTitle("Now")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.system(size: fontSize))
        .fontWeight(.bold)
        .onChange(of: location, initial: true) {
            Task {
                weather = await weatherProvider.currentWeather(for: location)
            }
        }
    }
}

#Preview("Known weather", traits: .modifier(SampleWeatherProvider())) {
    let location = SampleLocations.newYork.location
    LocationDetailsContainer {
        CurrentWeatherSection(location: location)
    }
}

#Preview("Unknown weather", traits: .modifier(SampleWeatherProvider())) {
    let location = SampleLocations.unknown.location
    LocationDetailsContainer {
        CurrentWeatherSection(location: location)
    }
}
