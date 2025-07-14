import Foundation

struct Location: Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
