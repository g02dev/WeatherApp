import Foundation
import Testing
@testable import Weather

struct WeatherClientTests {
    
    @Test
    func getCurrentWeather() async throws {
        let sampleDataLoader = SampleHTTPDataLoader(type: .currentWeather)
        let weatherClient = WeatherClient(dataLoader: sampleDataLoader)
        let expectedCurrentWeather = Weather(
            timestamp: Date(timeIntervalSince1970: 1726660758),
            timezone: try #require(TimeZone(secondsFromGMT: 7200)),
            temperature: 284,
            condition: .rain
        )
        
        let currentWeather = try? await weatherClient.getCurrentWeather(
            latitude: 7.367,
            longitude: 45.133,
            unitTemperature: .kelvin
        )
        
        #expect(currentWeather == expectedCurrentWeather)
    }
    
    @Test
    func getWeatherForecast() async throws {
        let sampleDataLoader = SampleHTTPDataLoader(type: .weatherForecast)
        let weatherClient = WeatherClient(dataLoader: sampleDataLoader)
        let expectedWeatherForecastCount = 4
        
        let weatherForecast = try await weatherClient.getWeatherForecast(
            latitude: 44.34,
            longitude: 10.99,
            unitTemperature: .kelvin
        )
        
        #expect(weatherForecast.count == expectedWeatherForecastCount)
    }
    
    @Test
    func findLocations() async throws {
        let sampleDataLoader = SampleHTTPDataLoader(type: .locationsByName)
        let weatherClient = WeatherClient(dataLoader: sampleDataLoader)
        let expectedLocationsCount = 5
        
        let locations = try await weatherClient.findLocations(
            query: "London"
        )
        
        #expect(locations.count == expectedLocationsCount)
    }
}
