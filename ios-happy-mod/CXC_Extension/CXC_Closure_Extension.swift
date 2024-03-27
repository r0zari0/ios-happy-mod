
import Foundation

func CXC_factorial(_ n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}

typealias CXC_EmptyClosure = () -> Void
typealias CXC_ValueClosure<T> = (T) -> Void
typealias CXC_ValueReturnClosure<T, V> = (T) -> V
typealias CXC_AsyncValueClosure<T> = (T) async -> Void
typealias CXC_AsyncEmptyClosure = () async -> Void
typealias CXC_AsyncThrowEmptyClosure = () async throws -> Void
typealias CXC_BuilderClosure<T> = () -> T
typealias CXC_BuilderClosureValue<V, T> = (V) -> T
