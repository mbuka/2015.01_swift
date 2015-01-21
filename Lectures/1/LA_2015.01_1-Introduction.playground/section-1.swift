//
// Lambda Academy 2015.01 Lecture 1
//

import Foundation

// Define three variables – a string, an integer and a double with implicit data type called like follows
// strVar
// intVar
// floVar

// Define three constants with explicit data type
// str
// int
// flo

// Define string constants which is a concatenation of the string defined in previous example, a space, and the float defined in ex. 1.

// Create one array and one dictionary with some elements

// Append one element to the simple array and to the simple dictionary declared in previous example

// Define a string variable that may or may not have a value, set it up to have a string equal to a string from previous example and then in the next line remove this value from a newly created variable (note that a variable that does not have a value is not the same as a variable with an empty string). Then assign this value back to string from previous example, what happens?

// Use "if let" syntax to deal with the optional values being not set and rewrite a previous example setting strVar within if let

// Define an empty dictionary containing characters as keys and integers as values.

// Write a for loop which populates the array with 10 entries of the following form: A->1, B->2 ...

// Create switch statement on the following "myVeg" variable, print it within switch. If it is tomato print it twice, if its cocumber, print it in a form "My favourite tomato is cocumber" where cocumber is taken from myVeg
let vegetables = ["red pepper", "green pepper", "cocumber", "tomato"]
let myVeg = vegetables[Int(arc4random()%3)]

// Change the above example by adding one more case that uses pattern matching ("where" keyword) to match all "peppers"


// Write a function 'testFunc' which takes two parameters
// 1. An integer (index)
// 2. A Function that returns a String 
// This function should return a tuple consising of:
// 1. Vegetable name that is under specified index (if exists) or a default value taken from a function passed as a second argument
// 2. an index
// use the following statements to test your implementation:

//testFunc(4, { return "default" });
//testFunc(0, { return "default" });
//testFunc(-1, { return "default" });

// Enums in Objective-C are just numbers, one of it's side effects possibility of performing calculations. for example the following if statement is true but it doesn't make sense:
if NSASCIIStringEncoding + NSNEXTSTEPStringEncoding == NSJapaneseEUCStringEncoding {
    print("NSASCIIStringEncoding + NSNEXTSTEPStringEncoding == NSJapaneseEUCStringEncoding !!!")
}

// Swifts' enums doesn't have such issue.
// Define swift enum that represents few encoding types

// Add an "extension" to the previous enumeration type that will adopt it to "Printable" protocol
