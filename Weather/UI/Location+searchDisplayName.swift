import Foundation

extension Location {
    var searchDisplayName: String {
        [name, state, country]
            .compactMap { $0 }
            .joined(separator: ", ")
    }
}

