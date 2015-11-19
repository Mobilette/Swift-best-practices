//: [Previous](@previous)

// MARK: - Error

enum MappingError: MBError
{
    case CanNotMapIntoObject(String)
    
    var code: Int {
        switch self {
        case .CanNotMapIntoObject:
            return 3001
        }
    }
    
    var domain: String {
        return "MappingDomain"
    }
    
    var description: String {
        switch self {
        case .CanNotMapIntoObject:
            return "Can not map objects."
        }
    }
    
    var reason: String {
        switch self {
        case .CanNotMapIntoObject(let JSONString):
            return "'\(JSONString)' can not be mapped into an object."
        }
    }
}

MappingError.CanNotMapIntoObject("{objects: []}").error

//: [Next](@next)
