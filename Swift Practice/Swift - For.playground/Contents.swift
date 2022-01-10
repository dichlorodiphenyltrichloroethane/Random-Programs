import UIKit


// 0..<5 = 0,1,2,3,4
for i in 0...10 where i % 2 == 0 {
    print(i)
}

var rand_int : [Int] = [Int]()

for _ in 0...24 {
    let temp_rand = Int.random(in: 0...100)
    rand_int.append(temp_rand)
}

print(rand_int)
