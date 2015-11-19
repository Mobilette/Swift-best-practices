import Foundation

public protocol URLRequestConvertible {
    var URLRequest: NSMutableURLRequest { get }
}

extension NSURLRequest: URLRequestConvertible {
    public var URLRequest: NSMutableURLRequest {
        return self.mutableCopy() as! NSMutableURLRequest
    }
}

public class Alamofire {
    public enum Method: String {
        case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
    }
    public enum ParameterEncoding {
        case JSON
        
        public func encode(
            URLRequest: URLRequestConvertible,
            parameters: [String: AnyObject]?)
            -> (NSMutableURLRequest, NSError?)
        {
            let mutableURLRequest = URLRequest.URLRequest
            
            guard let parameters = parameters else {
                return (mutableURLRequest, nil)
            }
            
            var encodingError: NSError? = nil
            do {
                let options = NSJSONWritingOptions()
                let data = try NSJSONSerialization.dataWithJSONObject(parameters, options: options)
                
                mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                mutableURLRequest.HTTPBody = data
            } catch {
                encodingError = error as NSError
            }
            return (mutableURLRequest, encodingError)
        }
    }
}