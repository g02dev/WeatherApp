import Foundation

extension Weather: Initializable {
    init?(_ weatherResponse: CurrentWeatherResponse) {
        guard let timezone = TimeZone(secondsFromGMT: weatherResponse.timezone),
              let weatherCondition = weatherResponse.weather.first
        else {
            return nil
        }
        
        self.timestamp = weatherResponse.dt
        self.timezone = timezone
        self.temperature = Int(weatherResponse.main.temp)
        self.condition = WeatherCondition(weatherCondition)
    }
}
