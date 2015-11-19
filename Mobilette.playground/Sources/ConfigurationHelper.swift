import Foundation

public class ConfigurationHelper
{
    public class func configuration(fileKey: String, key: String) -> String?
    {
        if let configuration = ConfigurationHelper.configurationFile(fileKey) {
            return configuration.objectForKey(key) as? String
        }
        return nil
    }
    
    public class func configurationFile(fileKey: String) -> NSDictionary?
    {
        let file = NSBundle.mainBundle().objectForInfoDictionaryKey(fileKey) as? String
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
}