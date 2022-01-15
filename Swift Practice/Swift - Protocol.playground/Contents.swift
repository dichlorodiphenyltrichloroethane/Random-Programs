import UIKit


// Naming convesion, x-able, x-ing

protocol Naming {
    //We will have this variable
    var name : String { get set }
    //We will have this method
    
    func getName() -> String
}

struct Whisky : Naming {
    var name : String
    
    func getName() -> String {
        return name
    }
}
