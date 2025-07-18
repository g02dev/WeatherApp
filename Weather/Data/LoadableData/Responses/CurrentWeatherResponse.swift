import Foundation

// API response: https://openweathermap.org/current
struct CurrentWeatherResponse: Decodable {
    let dt: Date //  Time of data calculation, unix, UTC
    let timezone: Int  // Shift in seconds from UTC
    let main: MainResponse
    let weather: [WeatherConditionResponse] // Can have more than 1 weather condition. The first one is primary.
    
    struct MainResponse: Decodable {
        let temp: Double
    }
}

extension CurrentWeatherResponse: Convertable {
    func convert() -> Weather? {
        Weather(self)
    }
}
