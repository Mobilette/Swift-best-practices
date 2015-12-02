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

public enum MBUserDefaultsError: MBError
{
    case Unknown(Int)
    case CanNotSynchronizeUserDefault
    
    public var code: Int {
        switch self {
        case .Unknown:
            return 2000
        case .CanNotSynchronizeUserDefault:
            return 2001
        }
    }
    
    public var domain: String {
        return "NSUserDefaultsDomain"
    }
    
    public var description: String {
        switch self {
        case .Unknown:
            return "Unknown error."
        case .CanNotSynchronizeUserDefault:
            return "Can not synchronize user defaults."
        }
    }
    
    public var reason: String {
        switch self {
        case .Unknown(let status):
            return "An unknown error with status : \(status)."
        case .CanNotSynchronizeUserDefault:
            return "."
        }
    }
}