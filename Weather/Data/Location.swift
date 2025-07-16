import Foundation

struct Location: Hashable, Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    
    var id: Self { self }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
