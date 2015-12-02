/*:

# Safe array

Accessing to an index that is not allocated yet, make the app crashing. That's why we are using class extension to fix this big issue.

For instance, this following code make the app crash:

    let test = ["test1", "test2", "test3"]
    test[5] // CRASH

So we introduced a safety array that returns nil if the index is not allocated yet:

    let test = ["test1", "test2", "test3"]
    test[safe: 5] // nil

## Summary

1. [Storyboard](Storyboard)
2. [API](API)
3. [Router](Router)
4. [Credential](Credential)
5. [Error](Error)
6. _Safe arrays_

*/
extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

let test = ["test1", "test2", "test3"]
test[safe: 5]
