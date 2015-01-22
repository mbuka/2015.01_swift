//
// Lambda Academy 2015.01 Lecture 1
//

import Foundation

// Define three variables – a string, an integer and a double with implicit data type

var strVar = "string"
var intVar = 1
var floVar = 2.0

// Define three constants with explicit data type

let str: String = "string"
let int: Int = 1
let flo: Double = 2.0

// Define string constants which is a concatenation of the string defined in previous example, a space, and the float defined in ex. 1.
let s = str + " " + "\(flo)"

// Create one array and one dictionary.

let arr = [1, 2, 3, 4]
let dic = ["a": 1, "b": 2, "c": 3]

// Append one element to the simple array and to the simple dictionary declared in previous example
let arr2 = arr + [5]

// Define a string variable that may or may not have a value, set it up to have a string equal to a string from previous example and then in the next line remove this value from a newly created variable (note that a variable that does not have a value is not the same as a variable with an empty string). Then assign this value back to string from previous example, what happens?

var maybeStr: String? = str
strVar = maybeStr!
maybeStr = nil
//strVar = maybeStr!  // this will cause BAD_ACCESS,

// Use "if let" syntax to deal with the optional values being not set and rewrite a previous example setting strVar within if let

if let aStr = maybeStr {
    strVar = aStr   // we don't have to explicitly unwrap an optional now
}

// Define an empty dictionary containing characters as keys and integers as values.

var dic2: [Character: Int] = [:]
var dic3 = [Character: Int]()

// Write a for loop which populates the array with 10 entries of the following form:

for a in 1...10 {
    let char = Character(UnicodeScalar(a+64))
    dic2[char] = a
}

dic2

// Create switch statement on the following "myVeg" variable, print it within switch. If it is tomato print it twice, if its cocumber, print it in a form "My favourite tomato is cocumber" where cocumber is taken from myVeg
let vegetables = ["red pepper", "green pepper", "cocumber", "tomato"]
let myVeg = vegetables[Int(arc4random()%3)]

switch myVeg {
    case "red pepper":
        println(myVeg)
    
    case "tomato":
        println(myVeg)
        println(myVeg)
    
    case "cocumber":
        println("My favourite veg is \(myVeg)")
    
    default:
        println(myVeg)
}

// Change the above example by adding one more case that uses pattern matching ("where" keyword) to match all "peppers"

switch myVeg {
    case let x where x.hasSuffix("pepper"):
    println("This is pepper called '\(x)'")
    
    default:
    println(myVeg)
}

// Write a function which takes two parameters
// 1. An integer (index)
// 2. A Function that returns a String 
// This function should return a tuple consising of:
// 1. Vegetable name that is under specified index (if exists) or a default value taken from a function passed as a second argument
// 2. an index
// Call this function, passing different indexes
func testFunc(x: Int, def: ()->String) -> (String, Int) {
    let res = (x >= 0 && x < vegetables.count) ? vegetables[x] : def()
    return (res, x)
}
testFunc(4, { return "default" });


// Enums in Objective-C are just numbers, one of it's side effects possibility of performing calculations. for example the following if statement is true but it doesn't make sense:
if NSASCIIStringEncoding + NSNEXTSTEPStringEncoding == NSJapaneseEUCStringEncoding {
    print("NSASCIIStringEncoding + NSNEXTSTEPStringEncoding == NSJapaneseEUCStringEncoding !!!")
}

// Swifts' enums doesn't have such issue.
// Define swift enum that represents few encoding types
enum Encoding {
    case UTF8Encoding
    case ASCIIEncoding
}


// Add an "extension" to the previous enumeration type that will adopt it to "Printable" protocol
extension Encoding: Printable {
    var description: String {
        get {
            switch self {
            case .UTF8Encoding:
                return "UTF8Enconding"
            case .ASCIIEncoding:
                return "ASCIIEncoding"
            }
        }
    }
}

Encoding.UTF8Encoding.description
