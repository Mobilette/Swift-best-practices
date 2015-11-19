import Foundation

public class Promise<T> {
    let state: Int
    public init() {
        state = 0
    }
}

extension Promise: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Promise: \(state)"
    }
}