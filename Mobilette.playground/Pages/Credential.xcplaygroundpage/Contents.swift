/*:

# Credential

Most of APIs are using an authentication system and you should to be able to store information safely. We are using the Security framework provided by Apple.

When you get the credential information, you should instantiate our MBOAuthCredential object:

    MBOAuthCredential(userIdentifier: "romsi", accessToken: "42", refreshToken: "43")

Our tool allow you to store credential into Keychain:

    try credential.storeToKeychain()

and retreive it:

    try MBOAuthCredential.retreiveCredential()

or retreive a specific credential:

    try MBOAuthCredential.retreiveCredential(userIdentifier: "romsi")


## Summary

1. [Storyboard](Storyboard)
2. [API](API)
3. [Router](Router)
4. _Credential_
5. [Error](Error)
6. [Safe arrays](Array)

*/
do {
    let credentialWithError = try MBOAuthCredential.retreiveCredential()
}
catch let error as MBError {
    print("error: \(error.error)")
}

let credential = MBOAuthCredential(userIdentifier: "romsi", accessToken: "42", refreshToken: "43")
do {
    try credential.storeToKeychain()
}
catch let error as MBError {
    print("error: \(error.error)")
}

let credentialWithoutError: MBOAuthCredential
do {
    credentialWithoutError = try MBOAuthCredential.retreiveCredential(userIdentifier: "romsi")
}
catch let error as MBError {
    print("error: \(error.error)")
    throw error
}

print(credentialWithoutError.token ?? "No access token.")
