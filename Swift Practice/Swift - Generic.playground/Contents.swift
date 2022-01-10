import UIKit

struct Drink {
    var name : String
    var price : Float
}

struct Food {
    var name : String
    var price : Float
}

struct myArrayList<T>{
    var elements = [T]()
    init(_ elements: [T]) {
        self.elements = elements
    }
}

var intMyAry = myArrayList([1,2,3])
print("\(intMyAry.elements)")
var strMyAry = myArrayList(["Mon", "Tues", "Wed"])
print("\(strMyAry.elements)")
