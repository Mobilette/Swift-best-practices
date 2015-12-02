/*:

# Error

Swift 2.0 introduce a new way to handle errors and we've created a protocol that should be implmented into enums that decribing errors.

You should create a enum that implements the MBError protocol as follows:

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

So, you should be able to throw error as follows:

    throw MBOAuthCredentialError.UserIdentifierMissing

## Summary

1. [Storyboard](Storyboard)
2. [API](API)
3. [Router](Router)
4. [Credential](Credential)
5. _Error_
6. [Safe arrays](Array)

*/
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
