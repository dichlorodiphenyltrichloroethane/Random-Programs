import UIKit

enum Weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
//    case Monday
//    case Tuesday
//    case Wednesday
//    case Thursday
//    case Friday
//    case Saturday
//    case Sunday
}

enum Month : Int {
    case Jan = 1
    case Feb = 2
    case Mar = 3
    case Apr = 4
    case May = 5
}

enum Name {
    case first(name: String)
    case middle(name: String)
    case last(name: String)
    
    func get_name() -> String {
        switch self {
        case .first(let name):
            return name
        case let .middle(name):
            return name
        case .last(let name):
            return name
        }
    }
}

let cur_day = Weekday.Wednesday
print("\(cur_day)")
let cur_mont = Month.Jan
print("\(cur_mont.rawValue)")
let my_name = Name.first(name: "Jackey ")
print("\(my_name)")
print("\(my_name.get_name())")
