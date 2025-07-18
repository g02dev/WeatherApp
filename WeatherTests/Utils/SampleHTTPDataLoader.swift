import Foundation
@testable import Weather

struct SampleHTTPDataLoader: DataLoader {
    var type: SampleDataType
    
    init (type: SampleDataType) {
        self.type = type
    }
    
    func loadData(from url: URL) throws -> Data {
        let bundle = Bundle(for: MyTestBundleHelperClass.self)
        let sampleDataURL = bundle.url(
            forResource: type.sampleJSONDataFilename,
            withExtension: "json"
        )
        
        guard let sampleDataURL else {
            throw LoadableDataError.invalidURL
        }
        
        let data = try Data(contentsOf: sampleDataURL)
        return data
    }
}

enum SampleDataType {
    case currentWeather
    case weatherForecast
    
    fileprivate var sampleJSONDataFilename: String {
        switch self {
        case .currentWeather: "CurrentWeather"
        case .weatherForecast: "WeatherForecast"
        }
    }
}

fileprivate class MyTestBundleHelperClass { }
