import Foundation

@Observable
final class WeatherProvider {
    
    private let client: WeatherClient?
    private let unitTemperature: UnitTemperature
    
    init(
        client: WeatherClient? = WeatherClient(dataLoader: HTTPDataLoader()),
        unitTemperature: UnitTemperature = UnitTemperature(forLocale: .current),
    ) {
        self.client = client
        self.unitTemperature = unitTemperature
    }
    
    func locationsByName(query: String) async -> [Location] {
        if let client = client {
            let locations = try? await client.findLocations(query: query)
            return locations ?? []
        } else {
            try? await Task.sleep(for: .milliseconds(.random(in: 10...100)))
            return SampleLocations.foundLocations(query: query)
        }
    }
    
    func currentWeather(for location: Location) async -> Weather?  {
        if let client = client {
            let weather = try? await client.getCurrentWeather(
                latitude: location.latitude,
                longitude: location.longitude,
                unitTemperature: unitTemperature
            )
            return weather
        } else {
            try? await Task.sleep(for: .milliseconds(.random(in: 10...1000)))
            return SampleWeather.currentWeather(for: location)
        }
    }
    
    func weatherForecast(for location: Location) async -> [Weather]  {
        if let client = client {
            let weather = try? await client.getWeatherForecast(
                latitude: location.latitude,
                longitude: location.longitude,
                unitTemperature: unitTemperature
            )
            return weather ?? []
        } else {
            try? await Task.sleep(for: .milliseconds(.random(in: 10...1000)))
            return SampleWeather.weatherForecast(for: location)
        }
    }
}
