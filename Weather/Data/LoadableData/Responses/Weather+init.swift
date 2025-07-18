import Foundation

extension Weather {
    init?(_ weatherResponse: WeatherResponse, timezoneResponse: Int) {
        guard let timezone = TimeZone(secondsFromGMT: timezoneResponse),
              let weatherConditionResponse = weatherResponse.weather.first
        else {
            return nil
        }
        
        self.timestamp = weatherResponse.dt
        self.timezone = timezone
        self.temperature = Int(weatherResponse.main.temp)
        self.condition = WeatherCondition(weatherConditionResponse)
    }
    
    init?(_ currentWeatherResponse: CurrentWeatherResponse) {
        guard let timezone = TimeZone(secondsFromGMT: currentWeatherResponse.timezone),
              let weatherConditionResponse = currentWeatherResponse.weather.first
        else {
            return nil
        }
        
        self.timestamp = currentWeatherResponse.dt
        self.timezone = timezone
        self.temperature = Int(currentWeatherResponse.main.temp)
        self.condition = WeatherCondition(weatherConditionResponse)
    }
}
