/*:

# Mobilette best practices

## Introduction

This document is a reference, a guide to match with the vision of Mobilette's staff.
We are using different tools, librairies and frameworks and you should to be alble to use it correctly.

Every apps made by Mobilette are using the [VIPER architecture](https://www.objc.io/issues/13-architecture/viper/) with the Swift language. To make apps faster than anyone, we are using a [base projet](https://github.com/Mobilette/MobiletteSwiftBaseProject), our own [Xcode templates](https://github.com/Mobilette/XcodeTemplates) and [Xcode snippets](https://github.com/Mobilette/VIPER-Xcode-Snippets).



## Requirements

- Xcode 7.0+
- iOS 8.0+



## Summary

1. [Storyboard](Storyboard)
2. [API](API)
3. [Router](Router)
4. [Credential](Credential)
5. [Error](Error)
6. [Safe arrays](Array)



## Get started

### Storyboard

Segues are one of the most powerful tools for developers, but one of the biggest problem are segues themselves. Managing identifiers are painful that's why we've created a tool to manage it easily.
This method was introduced by Apple during the WWDC 2015. We encourage you to [watch the session number 411](https://developer.apple.com/videos/play/wwdc2015-411/).

For more information, please visit the [Storyboard page](Storyboard).



### API

APIs can have many versions and managing it is a huge issue. For each version you should implement a specific class that respond to a common protocol.

For more information, please visit the [API page](API).



### Router

API services must use routers to define the route to access to remote resources.

A router must defines:

- the API version
- the API URL (could be define in a configuration file)
- the HTTP method
- the path to a specific resource

then you should be able to use it as follows:

    let userRouter = UserRouter.Create(["test": 42])

For more information, please visit the [Router page](Router).



### Credential

Most of APIs are using an authentication system and you should to be able to store information safely. We are using the Security framework provided by Apple.

Our tool allow you to store credential into Keychain:

    try credential.storeToKeychain()

and retreive it:

    try MBOAuthCredential.retreiveCredential()

For more information, please visit the [Credential page](Credential).



### Errors

Swift 2.0 introduce a new way to handle errors and we've created a protocol that should be implmented into enums that decribing errors.

So, you should be able to throw error as follows:

    throw MBOAuthCredentialError.UserIdentifierMissing

For more information, please visit the [Errors page](Error).



### Safe arrays

Accessing to an index that is not allocated yet, make the app crashing. That's why we are using class extension to fix this big issue.

For instance, this following code make the app crash:

    let test = ["test1", "test2", "test3"]
    test[5] // CRASH

So we introduced a safety array that returns nil if the index is not allocated yet:

    let test = ["test1", "test2", "test3"]
    test[safe: 5] // nil

For more information, please visit the [Safe arrays page](Array).



## Credits

Mobilette is owned and maintained by [Romain ASNAR](https://twitter.com/romsi94) and Benaly Issouf. You can follow them on Twitter at [@mobilette42](https://twitter.com/mobilette42).

## License

Mobilette is released under the MIT license. See LICENSE for details.

*/
