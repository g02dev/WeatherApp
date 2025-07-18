import Foundation

enum SampleLocations: CaseIterable {
    case unknown
    
    // Favorite
    case london
    case edinburgh
    case paris
    case madrid
    case newYork
    case singapore
    case nuuk
    case sydney
    
    // Not Favorite
    case lisbon
    
    var location: Location {
        switch self {
        case .unknown: Location(
            name: "Unknown Location",
            latitude: 0,
            longitude: 0,
            country: "UNKNOWN",
        )
            
        case .london: Location(
            name: "London",
            latitude: 51.507222,
            longitude: -0.1275,
            country: "GB",
            state: "England",
        )
            
        case .edinburgh: Location(
            name: "Edinburgh",
            latitude: 55.953251,
            longitude: -3.188267,
            country: "GB",
            state: "Scotland",
        )
            
        case .paris: Location(
            name: "Paris",
            latitude: 48.856614,
            longitude: 2.352222,
            country: "FR",
        )
            
        case .madrid: Location(
            name: "Madrid",
            latitude: 40.416761,
            longitude: -3.70335,
            country: "ES",
        )
            
        case .newYork: Location(
            name: "New York",
            latitude: 40.712775,
            longitude: -74.005973,
            country: "US",
            state: "New York",
        )
            
        case .singapore: Location(
            name: "Singapore",
            latitude: 1.352083,
            longitude: 103.819836,
            country: "SG",
        )
            
        case .nuuk: Location(
            name: "Nuuk",
            latitude: 62.050001,
            longitude: -51.999999,
            country: "GL",
        )
            
        case .sydney: Location(
            name: "Sydney",
            latitude: -33.86882,
            longitude: 151.209296,
            country: "AU",
        )
            
        case .lisbon: Location(
            name: "Lisbon",
            latitude: 38.707222,
            longitude: -9.133333,
            country: "PT",
        )
        }
    }
    
    static let allLocations: [Location] = allCases.map { $0.location }
    
    static let favoriteLocations: [Location] = Array(allLocations[1...8])
    
    static func foundLocations(query: String) -> [Location] {
        let lowercasedQuery = query.lowercased()
        return allLocations.filter { $0.name.lowercased().contains(lowercasedQuery) }
    }
}
