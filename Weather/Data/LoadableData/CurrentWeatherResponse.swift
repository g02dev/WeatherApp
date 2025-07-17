import Foundation

// API response: https://openweathermap.org/current
struct CurrentWeatherResponse: Decodable {
    let dt: Date //  Time of data calculation, unix, UTC
    let timezone: Int  // Shift in seconds from UTC
    let main: Main
    let weather: [Weather] // Can have more than 1 weather condition. The first one is primary.
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct Weather: Decodable {
        let id: Int
    }
}
