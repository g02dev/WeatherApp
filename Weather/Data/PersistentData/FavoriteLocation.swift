import Foundation
import SwiftData

@Model
final class FavoriteLocation {
    #Index<FavoriteLocation>([\.latitude, \.longitude], [\.dateCreated])
    
    var name: String
    var latitude: Double
    var longitude: Double
    var country: String
    var state: String?
    
    var dateCreated: Date
    
    init(name: String, latitude: Double, longitude: Double, country: String, state: String? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.state = state
        self.dateCreated = .now
    }
}
