import UIKit

////Main
//
////Do UI stuff on the main
//DispatchQueue.main.async {
//    foo()
//}
//
//func foo() {
//
//}
//
////Background
////Downloading data, waiting for something
////qos: Quality of service
//DispatchQueue.global(qos: .background).async {
//    //fetch data from the api
//    DispatchQueue.main.async {
//        //update ui
//    }
//}

/* ------------------------------------------------- */
// Naming Convention: Reverse DNS Style
//let queue = DispatchQueue(label: "test.queue")
//
//queue.async {
//    print("1")
//    queue.sync {
//        print("2")
//        queue.async {
//            print("3")
//        }
//    }
//}
//
//queue.async {
//    print("4")
//}
//
//queue.async {
//    print("5")
//}
/* ------------------------------------------------- */
//
//let queue = DispatchQueue(label: "test.con.queue", attributes: .concurrent)
//
//queue.async {
//    print("Hello from 1")
//    print("Hello from 1")
//    print("Hello from 1")
//}
//
//queue.async {
//    print("Hello from 2")
//    print("Hello from 2")
//    print("Hello from 2")
//}

/* ------------------------------------------------- */

//Difference between sync and async

//When sync is running it hold the thread and doesnt allow other thread to run
//Basically like a mutex lock, where sync start it gets the lock and release when before sync finishes
