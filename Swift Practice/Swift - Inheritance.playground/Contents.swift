import UIKit


class Spirit {
    var name : String
    var brand : String
    
    init(_ name: String, _ brand : String) {
        self.name = name
        self.brand = brand
    }
    
    func nameBrand(){
        print("\(self.name) is from \(self.brand)")
    }
}

class Whisky : Spirit {
    override init(_ name: String, _ brand: String) {
        super.init(name, brand)
    }
    
    override func nameBrand() {
        print("\(self.name) is a whisky from \(self.brand)")
    }
}

let vodka = Spirit("Beluga", "Marinsk Distillery")
vodka.nameBrand()
let glendronach = Whisky("Glendronach 21", "Brown-Forman Corporation")
glendronach.nameBrand()
