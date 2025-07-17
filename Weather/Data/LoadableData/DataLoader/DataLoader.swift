import Foundation

protocol DataLoader {
    func loadData(from url: URL) async throws -> Data
}
