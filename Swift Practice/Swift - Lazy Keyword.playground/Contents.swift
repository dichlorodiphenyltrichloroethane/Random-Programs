import UIKit

struct Whisky {
    init() {
        print("New whisky has created")
    }
}

struct Spirit {
    var name : String
    //Doesnt instant create the instance
    lazy var whisky : Whisky = Whisky()
    
    init(_ name: String) {
        self.name = name
        print("Spirit has been created")
    }
}

var mySpirit = Spirit("Glendronach")

mySpirit.whisky = Whisky()
