import Foundation

struct LocationResponse: Decodable {
    var name: String
    var lat: Double
    var lon: Double
    var country: String
    var state: String?
}

extension Array: Convertable where Element == LocationResponse {
    func convert() -> [Location]? {
        compactMap { locationResponse in
            Location(locationResponse)
        }
    }
}
