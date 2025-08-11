import Foundation

struct Location: Hashable, Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String?
    
    var id: Int { self.hashValue }
    
    init(name: String, latitude: Double, longitude: Double, country: String, state: String? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.state = state
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
