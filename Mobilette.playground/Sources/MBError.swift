import Foundation

public protocol MBError: ErrorType
{
    var code: Int { get }
    var domain: String { get }
    var reason: String { get }
    var description: String { get }
    var error: NSError { get }
}

extension MBError
{
    public var error: NSError {
        let userInfo = [
            NSLocalizedDescriptionKey: self.description,
            NSLocalizedFailureReasonErrorKey: self.reason
        ]
        return NSError(domain: self.domain, code: self.code, userInfo: userInfo)
    }
}