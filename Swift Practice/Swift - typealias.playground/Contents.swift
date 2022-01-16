import UIKit

//Use for shortening
protocol Naming {
    func getName() -> String
}

protocol Aging {
    func getAge() -> Int
}

typealias Whiskiable = Naming & Aging

//struct Whisky : Naming & Aging {
//
//}

struct Whisky : Whiskiable {
    var name : String
    var age : Int

    func getName() -> String {
        return self.name
    }
    
    func getAge() -> Int {
        return self.age
    }
    
}

typealias myString = String

var myName : myString = "Jackey"
print(myName)

typealias StringBlock = (String) -> Void

func sayHi(completion: StringBlock) {
    print("hello")
    completion("Bye")
}
sayHi(completion: { saying in
    print(saying)
    
})

typealias MyType = MyClass.SPIRIT_TYPE

class MyClass {
    enum SPIRIT_TYPE {
        case vodka, gin, tequila
    }
    
    var mySpirit = MyType.vodka
}

var myClass = MyClass()
myClass.mySpirit = MyType.vodka
print(myClass.mySpirit)

