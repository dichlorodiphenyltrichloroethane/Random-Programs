import UIKit

final class Spirit {
    var name : String
    
    init(_ name : String) {
        self.name = name
    }
}
//Since class is final, it cannnot be inherited
class Whisky : Spirit {
    override init(_ name: String) {
        super.init(name + " Whisky")
    }
}



