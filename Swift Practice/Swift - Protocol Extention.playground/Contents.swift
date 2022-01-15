import UIKit

protocol Naming {
    var name: String { get set }
    var region: String { get set }
    
    func getName() -> String
}

//Cannot put logic inside naming but can put logic inside the extention
extension Naming {
    func getNameRegion() -> String {
        return self.name + " is from " + self.region
    }
//    func getName() -> String {
//        return self.name
//    }
}

struct Whisky : Naming {
    var name : String
    var region: String
    
    func getName() -> String {
        return self.name
    }
}

let myWhisky = Whisky(name: "Glendronach", region: "Speyside")

print(myWhisky.getNameRegion())
