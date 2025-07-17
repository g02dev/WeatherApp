import Foundation

struct HTTPDataLoader: DataLoader {
    
    private static let successStatusCodes = 200...299
    
    func loadData(from url: URL) async throws -> Data  {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw LoadableDataError.invalidHTTPResponse
        }
        
        guard Self.successStatusCodes.contains(response.statusCode) else {
            throw LoadableDataError.unsuccessfulHTTPRequest
        }
        
        return data
    }
}
