import Foundation

struct WeatherClient {
    
    private let dataLoader: DataLoader
    
    init(dataLoader: DataLoader = HTTPDataLoader()) {
        self.dataLoader = dataLoader
    }
    
    func getCurrentWeather(
        latitude: Double,
        longitude: Double,
        unitTemperature: UnitTemperature
    ) async throws -> Weather {
        let url = Self.currentWeatherURL(
            latitude: latitude,
            longitude: longitude,
            unitTemperature: unitTemperature
        )
        let data = try await loadData(from: url)
        let currentWeather = try processData(
            data: data,
            dataType: CurrentWeatherResponse.self,
            finalType: Weather.self
        )
        return currentWeather
    }
    
    func getWeatherForecast(
        latitude: Double,
        longitude: Double,
        unitTemperature: UnitTemperature
    ) async throws -> [Weather] {
        let url = Self.weatherForecastURL(
            latitude: latitude,
            longitude: longitude,
            unitTemperature: unitTemperature
        )
        let data = try await loadData(from: url)
        let weatherForecast = try processData(
            data: data,
            dataType: WeatherForecastResponse.self,
            finalType: [Weather].self
        )
        return weatherForecast
    }
}

private extension WeatherClient {
    #warning("Put API key here. Do not commit to GitHub.")
    private static let apiKey = "*"
    
    private static let baseURLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        return components
    }()
    
    private static func currentWeatherURL(
        latitude: Double,
        longitude: Double,
        unitTemperature: UnitTemperature
    ) -> URL? {
        var components = baseURLComponents
        components.path = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "units", value: unitTemperature.weatherClientValue),
            URLQueryItem(name: "appid", value: apiKey),
        ]
        return components.url
    }

    private static func weatherForecastURL(
        latitude: Double,
        longitude: Double,
        unitTemperature: UnitTemperature
    ) -> URL? {
        var components = baseURLComponents
        components.path = "/data/2.5/forecast"
        components.queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "units", value: unitTemperature.weatherClientValue),
            URLQueryItem(name: "appid", value: apiKey),
        ]
        return components.url
    }
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
    
    private func loadData(from url: URL?) async throws -> Data {
        guard let url else {
            throw LoadableDataError.invalidURL
        }
        let data = try await dataLoader.loadData(from: url)
        return data
    }
    
    private func processData<D: Decodable & Convertable, F>(
        data: Data,
        dataType: D.Type,
        finalType: F.Type
    ) throws -> F where D.FinalType == F {
        let responseData = try Self.decoder.decode(dataType, from: data)
        let finalData = responseData.convert()
        
        guard let finalData else {
            throw LoadableDataError.invalidData
        }
        
        return finalData
    }
}

private extension UnitTemperature {
    var weatherClientValue: String {
        switch self {
        case .kelvin: "standard"
        case .celsius: "metric"
        case .fahrenheit: "imperial"
        default: "standard"
        }
    }
}
