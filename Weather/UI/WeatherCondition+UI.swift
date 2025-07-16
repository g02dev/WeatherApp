import SwiftUI

extension WeatherCondition {
    var displayName: String {
        switch self {
        case .unknown:
            return "Unknown"
        case .thunderstorm:
            return "Thunderstorm"
        case .drizzle:
            return "Drizzle"
        case .rain:
            return "Rain"
        case .snow:
            return "Snow"
        case .clear:
            return "Clear"
        case .clouds:
            return "Clouds"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .unknown:
            return "questionmark.circle"
        case .thunderstorm:
            return "cloud.bolt.fill"
        case .drizzle:
            return "cloud.drizzle.fill"
        case .rain:
            return "cloud.rain.fill"
        case .snow:
            return "cloud.snow.fill"
        case .clear:
            // TODO: Add day(sun) and night(moon) options
            return "sun.max.fill"
        case .clouds:
            return "cloud.fill"
        }
    }
    
    var systemImagePalette: SystemImagePalette {
        let gray = Color(uiColor: .lightGray)
        return switch self {
        case .unknown:
            SystemImagePalette(primary: gray, secondary: gray)
        case .thunderstorm:
            SystemImagePalette(primary: gray, secondary: .yellow)
        case .drizzle:
            SystemImagePalette(primary: gray, secondary: .blue)
        case .rain:
            SystemImagePalette(primary: gray, secondary: .blue)
        case .snow:
            SystemImagePalette(primary: gray, secondary: .blue)
        case .clear:
            SystemImagePalette(primary: .yellow)
        case .clouds:
            SystemImagePalette(primary: gray)
        }
    }
}
