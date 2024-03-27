
import Foundation

extension TTLS_Data {
    func ttls_json(using encoder: JSONEncoder = .init(), options: JSONSerialization.ReadingOptions = []) throws -> [String: Any] {
        return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any] ?? [:]
    }
}
