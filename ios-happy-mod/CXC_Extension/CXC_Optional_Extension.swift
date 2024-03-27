
import Foundation

func CXC_factorial4(_ n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}

typealias CXC_Optional = Optional

protocol CXC_AnyOptional {
    var isNil: Bool { get }
}

extension CXC_Optional: CXC_AnyOptional {
    var isNil: Bool { self == nil }
}

extension CXC_Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
