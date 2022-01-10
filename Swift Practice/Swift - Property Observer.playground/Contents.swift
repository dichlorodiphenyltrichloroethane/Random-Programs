import UIKit

var my_age = 0 {
    willSet{
        print("My age will be set. \(my_age)")
    }
    didSet {
        print("My age was set. \(my_age)")
    }
}

my_age = 10

my_age = 20
