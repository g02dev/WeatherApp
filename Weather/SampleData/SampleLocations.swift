import Foundation

enum SampleLocations: CaseIterable {
    case london
    case edinburgh
    case paris
    case madrid
    case newYork
    case singapore
    case nuuk
    case sydney
    
    var location: Location {
        switch self {
        case .london: Location(name: "London", latitude: 51.507222, longitude: -0.1275)
        case .edinburgh: Location(name: "Edinburgh", latitude: 55.953251, longitude: -3.188267)
        case .paris: Location(name: "Paris", latitude: 48.856614, longitude: 2.352222)
        case .madrid: Location(name: "Madrid", latitude: 40.416761, longitude: -3.70335)
        case .newYork: Location(name: "New York", latitude: 40.712775, longitude: -74.005973)
        case .singapore: Location(name: "Singapore", latitude: 1.352083, longitude: 103.819836)
        case .nuuk: Location(name: "Nuuk", latitude: 62.050001, longitude: -51.999999)
        case .sydney: Location(name: "Sydney", latitude: -33.86882, longitude: 151.209296)
        }
    }
    
    static var allLocations: [Location] {
        SampleLocations.allCases.map { $0.location }
    }
    
    static let unknownLocation: Location = Location(name: "Unknown Location", latitude: 0, longitude: 0)
}
