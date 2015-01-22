//
// Lambda Academy 2015.01 Lecture 1
//

import Foundation

func readFile1(url: String, encoding: NSStringEncoding) -> String? {
    var maybeError: NSError? = nil
    let maybeString: String? = NSString(contentsOfURL: NSURL(string: url)!,
        encoding: encoding, error: &maybeError)
    return maybeString
}

enum ReadFileResult {
    case Success(String)
    case Failure(NSError)
}

func readFile(url: String, encoding: NSStringEncoding) -> ReadFileResult {
    var maybeError: NSError?
    let maybeString: String? = NSString(contentsOfURL: NSURL(string: url)!,
        encoding: encoding, error: &maybeError)
    if let string = maybeString {
        return ReadFileResult.Success(string)
    } else if let error = maybeError {
        return ReadFileResult.Failure(error)
    } else {
        assert(false, "something really wrong")
    }
}

let url2 = "http://apple.com"    // try also http://google.com doesn't work (SSL error)
readFile(url2, NSUTF8StringEncoding)




func readFile2(path: String, encoding: NSStringEncoding) -> Result<String>
{
    var maybeError: NSError?
    let maybeString: String? = NSString(contentsOfURL: NSURL(string: url)!,
        encoding: encoding, error: &maybeError)
    if let string = maybeString {
        return Result.Success(Box(string))
    } else if let error = maybeError {
        return Result.Failure(error)
    } else {
        assert(false, "something really wrong")
    }
}

let url = "http://apple.com"    // try also http://google.com doesn't work (SSL error)
readFile1(url, NSUTF8StringEncoding)

switch readFile(url, NSUTF8StringEncoding) {
case let ReadFileResult.Success(str):
    println("File succesfully opened, content: \(str)")
    
case let ReadFileResult.Failure(error):
    println("Failed to open file. Error code: \(error.code)")
}

switch readFile2(url, NSUTF8StringEncoding) {
case let Result.Success(str):
        println("File succesfully opened, content: \(str.unbox)")
    
case let Result.Failure(error):
    println("Failed to open file. Error code: \(error.code)")
}


func writeFile(contents: String, path: String, encoding: NSStringEncoding) -> Result<()>
{
    return Result.Success(Box())    // empty box
}

switch writeFile("aaa", "aaa", NSUTF8StringEncoding){
case let Result.Success(a):
println("write success")

case let Result.Failure(error):
println("failed")
}
