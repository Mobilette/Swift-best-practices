// MARK: - Credential

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