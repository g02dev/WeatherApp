import Foundation

enum LoadableDataError: Error {
    case invalidURL
    case invalidHTTPResponse
    case unsuccessfulHTTPRequest
    case invalidData
}
