import Foundation

// API response: https://openweathermap.org/forecast5
struct WeatherForecastResponse: Decodable {
    let city: CityResponse
    let list: [WeatherResponse]
    
    struct CityResponse: Decodable {
        let timezone: Int
    }
}

extension WeatherForecastResponse: Convertable {
    func convert() -> [Weather]? {
        let timezoneResponse = city.timezone
        return list.compactMap { weatherResponse in
            Weather(weatherResponse, timezoneResponse: timezoneResponse)
        }
    }
}
