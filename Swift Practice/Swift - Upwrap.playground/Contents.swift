import UIKit


//Optional Value: Cant tell if value is allocated inside the variable or bot

var some_var : Int? = nil

//Change this
if some_var == nil {
    some_var = 123
}

//Unwrapping

if let new_var = some_var {
    print("Unwrapped \(new_var)")
} else {
    print("No value")
}

let my_var = some_var ?? 100
print("\(my_var)")
