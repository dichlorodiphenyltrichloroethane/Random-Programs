import UIKit

var mySpiritSet : Set<String> = ["Vodka", "Gin", "Tequilla", "Pisco"]
var myWhiskySet : Set<String> = Set<String>()
myWhiskySet.insert("Speyside")
myWhiskySet.insert("Speyside")
myWhiskySet.insert("Highland")
myWhiskySet.insert("Lowland")
myWhiskySet.insert("Islay")
myWhiskySet.insert("Campbeltown")

myWhiskySet.count

for whisky in myWhiskySet {
    print("Region: ", whisky)
}

mySpiritSet.contains("Gin")

if let indexToRemove = mySpiritSet.firstIndex(of: "Gin") {
    print("Index: \(indexToRemove)")
    mySpiritSet.remove(at: indexToRemove)
}

mySpiritSet
