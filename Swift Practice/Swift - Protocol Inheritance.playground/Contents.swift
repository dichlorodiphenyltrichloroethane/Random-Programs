import UIKit

protocol Naming {
    var name : String { get set }
    func getName() -> String
}

protocol Aging {
    var age : Int { get set }
}

protocol UserNotifiable : Naming, Aging {
    
}

struct Whisky : UserNotifiable {
    var name: String
    
    func getName() -> String {
        return name
    }
    
    var age: Int
    
    
}

class Whiskey : UserNotifiable {
    var name: String
    var age: Int
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
    
    func getName() -> String {
        return self.name
    }
    
    
}

var myWhiskey = Whiskey("Glendronach", 21)
print(myWhiskey.age)
