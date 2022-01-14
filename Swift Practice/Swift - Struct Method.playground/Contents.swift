import UIKit

struct Whisky {
    var name : String
    var vintage : Int
    
    func whiskyInfo() -> String {
        print("sayName() called")
        return "This whisky is called \(name) and its vintage is \(vintage)"
    }
}

//Struct can have a method
var myWhisky = Whisky(name: "Glendronach", vintage: 1933)
let msg = myWhisky.whiskyInfo()
print(msg)
