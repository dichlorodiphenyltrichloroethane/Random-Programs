import UIKit

//Collection: List of data
// Array, Set, Dictionary, Tuple


var int_ary : [Int] = [1,2,3,4,5]

for i in int_ary {
    print("\(i)")
}

for i in int_ary where i % 2 == 0{
    print("\(i)")
}
