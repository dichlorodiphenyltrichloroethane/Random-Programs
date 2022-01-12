import UIKit



var whisky = ["Speyside" : "Glendronach",
              "Campbeltown" : "Springbank",
              "Islay" : "Laphroaig"]

let peat = whisky["Islay"]

let hl = whisky["Highland", default: "Highland Park"]
whisky["Highland"] = "Highland Park"
whisky.updateValue("Glenallachie", forKey: "Speyside")
print(whisky["Speyside"] ?? "Missing")

whisky.count

//let emptyDictionary : [String : Int] = [:]
//let emptyDictionary : [String : Int] = [String : Int]()
//let emptyDictionary : [String : Int] = Dictionary<String, Int>()

for item in whisky{
    print("\(item.key) \(item.value)")
}
