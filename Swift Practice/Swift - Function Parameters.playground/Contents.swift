import UIKit


//Takes String and return String
func hi(name: String) -> String {
    return "Hello World to \(name)!"
}
func hi_cool(cool name: String) -> String {
    return "Hello World to \(name)!"
}
func hi_mia(_ name: String) -> String {
    return "Hello World to \(name)!"
}

hi(name: "Jackey")
hi_cool(cool: "Cool Jackey")
hi_mia("Blend Jackey")
