//: [Previous](@previous)

import Foundation

// MARK: - Router

protocol TwitterRouterProtocolV2: RouterProtocol {
}

extension TwitterRouterProtocolV2 {
    var version: String {
        return "v2"
    }
    var baseURLString: String? {
        if let baseURLStringFromConfiguration = self.baseURLStringFromConfiguration {
            return "\(baseURLStringFromConfiguration)/\(self.version)"
        }
        return "http://api.twitter.com/\(self.version)"
    }
}

enum UserRouter: TwitterRouterProtocolV2, URLRequestConvertible
{
    case Create([String: AnyObject])
    case Update(String, [String: AnyObject])
    
    var method: Alamofire.Method {
        switch self {
        case .Create:
            return .POST
        case .Update:
            return .PATCH
        }
    }
    
    var resource: String {
        return "user"
    }
    
    var path: String {
        switch self {
        case .Create:
            return "/\(resource)/"
        case .Update(let identifier, _):
            return "/\(resource)/\(identifier)/"
        }
    }
    
    // MARK: - URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let mutableURLRequest: NSMutableURLRequest = self.baseURLRequest
        
        switch self {
        case .Create(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .Update(_, let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        }
    }
}

let userRouter = UserRouter.Create(["test": 42])
print(userRouter.URLRequest)

//: [Next](@next)
