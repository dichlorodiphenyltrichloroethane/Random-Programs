import UIKit

var greeting = "Hello, playground"

//Use when changing the variable's value inside the funciton
func greet(_ name : inout String) {
    name = "Hi, " + name
    print(name)
}

var myName = "Jackey"
greet(&myName)
