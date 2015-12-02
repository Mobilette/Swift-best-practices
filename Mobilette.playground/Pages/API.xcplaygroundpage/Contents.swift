/*:

# API

APIs can have many versions and managing it is a huge issue.

You must define a protocol used for any API version :

    protocol TwitterAPIServiceProtocol {
        static func fetchAllTweets() -> Promise<String>
    }

Then you must implement it for any API versions :

    class TwitterAPIV1Service: TwitterAPIServiceProtocol {
        class func fetchAllTweets() -> Promise<String> {
            return Promise<String>()
        }
    }

## Summary

1. [Storyboard](Storyboard)
2. _API_
3. [Router](Router)
4. [Credential](Credential)
5. [Error](Error)
6. [Safe arrays](Array)

*/
protocol TwitterAPIServiceProtocol {
    static func fetchAllTweets() -> Promise<String>
}

class TwitterAPIV1Service: TwitterAPIServiceProtocol {
    class func fetchAllTweets() -> Promise<String> {
        // Use special logic to match with the Twitter API version 1.
        return Promise<String>()
    }
}

class TwitterAPIV2Service: TwitterAPIServiceProtocol {
    class func fetchAllTweets() -> Promise<String> {
        // Use special logic to match with the Twitter API version 2.
        return Promise<String>()
    }
}

class TwitterAPIService: TwitterAPIV1Service {
}

let promise = TwitterAPIService.fetchAllTweets()
