//: [Previous](@previous)

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

let test = ["test1", "test2", "test3"]
test[safe: 5]

//: [Next](@next)
