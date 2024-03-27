
import Foundation

enum CXC_APIError: Error {
    case checkUpdateError(type: CXC_ContentType, errorDescription: String)
    case invalidURL
    case unexpectedResponse
    case noInternetConnection
    case qiblaWithoutLocation
    case parseError(CXC_ContentType)
    case error(String)
}

extension CXC_APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .unexpectedResponse: return "Unexpected response from the server"
        case .noInternetConnection: return "Please check your internet connection and try again"
        case .qiblaWithoutLocation: return "Location permission is required in order to use Quibla Compass"
        case let .checkUpdateError(type, errorDescription): return "Update Error \(type) - \(errorDescription)"
        case .parseError(let type): return "Parse error \(type.rawValue)"
        case .error(let error): return error
        }
    }
}
