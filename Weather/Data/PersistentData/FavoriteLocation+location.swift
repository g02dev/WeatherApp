import Foundation

extension FavoriteLocation {
    var location: Location {
        Location(
            name: name,
            latitude: latitude,
            longitude: longitude,
            country: country,
            state: state
        )
    }
}
