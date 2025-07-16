import Foundation

enum SampleWeather {
    static func currentWeather(for location: Location) -> Weather? {
        let sampleLocation = SampleLocations.allCases.first { $0.location == location }
        return sampleLocation?.currentWeather
    }
    
    static func weatherForecast(for location: Location) -> [Weather] {
        let timestamp = Date.now
        let timeZone = TimeZone(identifier: "Europe/London")!
        let temperatures = [11, 12, 8, 20, -14, 18, 10]
        let conditions = [
            WeatherCondition.clouds,
            .rain,
            .thunderstorm,
            .clear,
            .snow,
            .clouds,
            .drizzle
        ]
        
        let forecast: [Weather] = zip(temperatures, conditions)
            .enumerated()
            .compactMap { (index, weatherData) in
                guard let currentTimestamp = Calendar.current.date(
                    byAdding: .hour,
                    value: index * 3,
                    to: timestamp
                ) else { return nil }
                
                let (temperature, condition) = weatherData
                return Weather(
                    timestamp: currentTimestamp,
                    timezone: timeZone,
                    temperature: temperature,
                    condition:  condition
                )
            }
        return forecast
    }
}

private extension SampleLocations {
    var currentWeather: Weather {
        switch self {
        case .london:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "Europe/London")!,
                temperature: 11,
                condition: .clouds
            )
        
        case .edinburgh:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "Europe/London")!,
                temperature: 12,
                condition: .rain
            )
            
        case .paris:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "Europe/Paris")!,
                temperature: 8,
                condition: .thunderstorm
            )
            
        case .madrid:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "Europe/Madrid")!,
                temperature: 20,
                condition: .clear
            )
            
        case .newYork:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "America/New_York")!,
                temperature: 10,
                condition: .drizzle
            )
            
        case .singapore:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "Asia/Singapore")!,
                temperature: 32,
                condition: .clear
            )
            
        case .nuuk:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "America/Nuuk")!,
                temperature: -10,
                condition: .snow
            )
        
        case .sydney:
            Weather(
                timestamp: .now,
                timezone: TimeZone(identifier: "Australia/Sydney")!,
                temperature: 25,
                condition: .unknown
            )
        }
    }
}
