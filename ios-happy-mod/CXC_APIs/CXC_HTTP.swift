
import Foundation

enum CXC_HTTPMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

enum CXC_HTTPHeadersKey: String {

    case contentType = "Content-Type"
    case authorization = "Authorization"
    case contentDisposition = "Content-Disposition"
    case contentLength = "Content-Length"
    case applicationId = "X-Parse-Application-Id"
    case restApiKey = "X-Parse-REST-API-Key"
}

typealias CXC_HTTPCode = Int
typealias CXC_HTTPCodes = Range<Int>
typealias CXC_HTTPHeaders = [String: String]
typealias CXC_Parameters = [String: Any]

extension CXC_HTTPCodes {
    static let success = 200 ..< 300
}

