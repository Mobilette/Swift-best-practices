//: [Previous](@previous)

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

//: [Next](@next)
