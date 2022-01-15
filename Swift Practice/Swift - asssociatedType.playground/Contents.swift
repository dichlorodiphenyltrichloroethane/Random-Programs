import UIKit

protocol Spiritable {
    associatedtype T
    var type: [T] { get set }
    mutating func gotNewSpirit(_ newSpirit: T)
}

extension Spiritable {
    mutating func gotNewSpirit(_ newSpirit: T) {
        self.type.append(newSpirit)
    }
}

enum SpiritType {
    case vodka, gin, tequila, whisky
}

struct Spirit : Spiritable {
    var type: [SpiritType] = []
}

struct Vodka : Spiritable {
    var type : [String] = []
}

var mySpirit = Spirit()
mySpirit.gotNewSpirit(SpiritType.whisky)
mySpirit.gotNewSpirit(SpiritType.vodka)
for item in mySpirit.type {
    print(item)
}


var myVodka = Vodka()
myVodka.gotNewSpirit("Chopin")
myVodka.gotNewSpirit("Belvedere")
for item in myVodka.type {
    print(item)
}

