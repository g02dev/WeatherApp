import Foundation

// API response: https://openweathermap.org/forecast5
struct WeatherResponse: Decodable {
    let dt: Date //  Time of data calculation, unix, UTC
    let main: MainResponse
    let weather: [WeatherConditionResponse] // Can have more than 1 weather condition. The first one is primary.
    
    struct MainResponse: Decodable {
        let temp: Double
    }
}
