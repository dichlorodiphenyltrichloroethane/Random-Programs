import UIKit

enum MismatchError : Error {
    case nameMismatch
    case numberMismatch
}

func guessMyName(name input: String) throws {
    print("guessMyName() called")
    if (input != "jackey") {
        print("Incorrect")
        throw MismatchError.nameMismatch
    }
    print("Correct")
}

func guessMyNumber(num input: Int) throws -> Bool {
    print("guessMyNumber() called")
    if (input != 3) {
        print("Incorrect")
        throw MismatchError.numberMismatch
    }
    print("Correct")
    return true
}

//Question mark mean im not going to deal with an error
try? guessMyName(name: "jackey")
//exclamation mark means there will be no error
try! guessMyName(name: "jackey")

do {
    try guessMyName(name: "jacket")
} catch {
    print("Error: \(error)")
}

do {
    let result = try guessMyNumber(num: 3)
    print(result)
} catch {
    print("Error: \(error)")
}

