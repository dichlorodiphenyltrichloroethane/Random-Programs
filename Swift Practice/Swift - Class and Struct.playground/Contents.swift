import UIKit

struct Question {
    var question_id : Int
    var question : String
    var answer : String
}
 class Question_Class {
    var question_id : Int
    var question : String
    var answer : String
    
    init(question_id: Int, question: String, answer: String) {
        self.question_id = question_id
        self.question = question
        self.answer = answer
    }
}

var question_one = Question(question_id: 1, question: "What is the capital of Australia", answer: "Sydney")
var question_one_copy = question_one
print("Capital of Australia is: \(question_one.answer)")
print("Copy - Capital of Australia is: \(question_one_copy.answer)")
question_one.answer = "Canberra"
print("Capital of Australia is: \(question_one.answer)")
print("Copy - Capital of Australia is: \(question_one_copy.answer)")

//Note: Struct deep copies instead of storing memory address

print("----------------------------------------------")
var question_one_class = Question_Class(question_id: 1, question: "What is the capital of Australia", answer: "Sydney")
var question_one_class_copy = question_one_class
print("Capital of Australia is: \(question_one_class.answer)")
print("Copy - Capital of Australia is: \(question_one_class_copy.answer)")
question_one_class .answer = "Canberra"
print("Capital of Australia is: \(question_one_class.answer)")
print("Copy - Capital of Australia is: \(question_one_class_copy.answer)")
