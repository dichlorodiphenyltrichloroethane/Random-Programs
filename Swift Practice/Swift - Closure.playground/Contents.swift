import UIKit

let name : String = {
    return "Jackey"
}()

print(name)

//closure
let nickName : (String) -> String = { (name: String) -> String in
    return "Swift man \(name)"
}

let printName : (String) -> Void = { (name: String) in
    print("\(name)")
    
}

nickName("Jackey")
printName("Printed Jackey")
