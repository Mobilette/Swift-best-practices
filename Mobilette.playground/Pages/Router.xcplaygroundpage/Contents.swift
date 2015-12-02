/*:

# Router

API services must use routers to define the route to access to remote resources.
    

First, you should extend the RouterProtocol to match the base URL and version you use for your API :

    extension TwitterRouterProtocolV2 {
        var version: String {
            return "v2"
        }
        var baseURLString: String? {
            return "http://api.twitter.com/\(self.version)"
        }
    }

You should use the bas URL from the configuration file instead of using a constant :

    var baseURLString: String? {
        if let baseURLStringFromConfiguration = self.baseURLStringFromConfiguration {
            return "\(baseURLStringFromConfiguration)/\(self.version)"
        }
        return "http://api.twitter.com/\(self.version)"
    }

Now you are able to create a router that define how to access to a specific resource from the API.

A router must be defined by:

- the HTTP method (POST, PATCH, GET, DELETE, ...)
- the path to a specific resource

but you could set:

- the OAuth token

For example:

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
    }

then you should be able to use it as follows:

let userRouter = UserRouter.Create(["test": 42])

## Summary

1. [Storyboard](Storyboard)
2. [API](API)
3. _Router_
4. [Credential](Credential)
5. [Error](Error)
6. [Safe arrays](Array)

*/
import Foundation

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
