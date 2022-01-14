import UIKit

class Whisky {
    var name : String
    
    init(_ name: String) {
        self.name = name
    }
    
    func changeName(_ newName: String) {
        self.name = newName
    }
}

struct Whiskey {
    var name : String
    
    mutating func changeName(_ newName: String) {
        self.name = newName
    }
}

var myWhisky = Whisky("Glendroanch")
myWhisky.changeName("Glengoyne")
print(myWhisky.name)
 
var myWhiskey = Whiskey(name: "Buffalo Trace")
myWhiskey.changeName("Wild Turkey")
print(myWhiskey.name)
