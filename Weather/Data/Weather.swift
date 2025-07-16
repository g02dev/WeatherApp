import Foundation

struct Weather: Hashable {
    let timestamp: Date
    let timezone: TimeZone
    let temperature: Int
    let condition: WeatherCondition
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(timestamp)
        hasher.combine(timezone)
    }
}
