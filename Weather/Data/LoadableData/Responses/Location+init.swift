import Foundation

extension Location {
    init?(_ locationResponse: LocationResponse) {
        self.name = locationResponse.name
        self.latitude = locationResponse.lat
        self.longitude = locationResponse.lon
        self.country = locationResponse.country
        self.state = locationResponse.state
    }
}
