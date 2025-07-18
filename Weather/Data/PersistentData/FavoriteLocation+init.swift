import Foundation

extension FavoriteLocation {
    convenience init(_ location: Location) {
        self.init(
            name: location.name,
            latitude: location.latitude,
            longitude: location.longitude,
            country: location.country,
            state: location.state
        )
    }
}
