import Foundation

// API response: https://openweathermap.org/weather-conditions
extension WeatherCondition {
    init(_ weatherConditionResponse: WeatherConditionResponse) {
        self = switch weatherConditionResponse.id {
        case 200...299: .thunderstorm
        case 300...399: .drizzle
        case 500...599: .rain
        case 600...699: .snow
        case 800: .clear
        case 801...899: .clouds
        default: .unknown
        }
    }
}
