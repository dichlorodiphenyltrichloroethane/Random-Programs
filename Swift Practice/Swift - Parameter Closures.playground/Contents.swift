import UIKit

//func greeting(completion: () -> Void) {
//    print("Hello World!")
//    sleep(2)
//    //run completion closure
//    completion()
//}
//
//greeting(completion: {
//    print("2 seconds has past after the greetings - 1 ")
//})
//
//greeting() {
//    print("2 seconds has past after the greetings - 2")
//}
//
//greeting {
//    print("2 seconds has past after the greetings - 3")
//}

/* ------------------------------------------------------  */
//func reply(completion: (String) -> Void) {
//    print("Hello World - reply")
//    sleep(2)
//    completion("2 sec has passed")
//}
//
//reply(completion: { (msg : String) in
//    print("It said", msg)
//})
//
//reply{
//    print("it said", $0)
//}

/* ------------------------------------------------------  */

//Optional closure 

func optionalGreeting(completion: (()-> Void)? = nil) {
    print("Hello World - opt")
    sleep(2)
    completion?()
}

optionalGreeting()

optionalGreeting{
    print("Hello!")
}
