# Lambda Academy 2015.01 - Swift
## Lecture 1

### Introduction to Swift
Open file called `LA_2015.playground` and follow the instructions there.

### Enums & Error Handling 
Create a new playground and paste there the following method:

```
func readFile1(url: String, encoding: NSStringEncoding) -> String? {
    var maybeError: NSError? = nil
    let maybeString: String? = NSString(contentsOfURL: NSURL(string: url)!,
        encoding: encoding, error: &maybeError)
    return maybeString
}
```

#### Exercise 1
Notice that a possible error variable is not returned from readFile1 function, implement a new `readFile` method that will:
a) return both result and possible error
b) result if succes or Error if failed

Test it on:
1. [http://apple.com](http://apple.com)
2. [http://google.com](http://google.com)

##### Hint: use this enumeration definition:
```
enum ReadFileResult {
    case Success(String)
    case Failure(NSError)
}
```

#### Exercise 2
Wite a dummy implementation of the corresponding `writeFile` function. It may return Success and failure randomly.


#### Exercise 3
Use Generalised version of Result enum type:

```
class Box<T> {
    let unbox: T
    init(_ value: T) { self.unbox = value }
}
enum Result<T> {
    case Success(Box<T>)
    case Failure(NSError)
}
```

to reimplement both readFile and writeFile methods.


### Closures

Clousures are an equivalent to blocks form Objective-C - inline lambdas.
Objective-C block syntax isn't straightforward: [http://fuckingblocksyntax.com](http://fuckingblocksytax.com)
Swift is better... but still [http://fuckingswiftblocksyntax.com](http://fuckingswiftblocksyntax.com) may be of some help...

#### Exercise 1 - function that takes a function

```
func square(a:Float) -> Float {
    return a * a
}

func cube(a:Float) -> Float {
    return a * a * a
}

func averageSumOfSquares(a:Float,b:Float) -> Float {
    return (square(a) + square(b)) / 2.0
}

func averageSumOfCubes(a:Float,b:Float) -> Float {
    return (cube(a) + cube(b)) / 2.0
}
```

Take a look at the above function definitions, especially the later two. They have quite much in common. Implement a new function called `averageOfFunction` that will take a third argument that will be a function to apply to the first two arguments before calculating their average.

Then call this function this way:
```
averageOfFunction(3, 4, square)
averageOfFunction(3, 4, cube)
```

#### Exercise 2 - lambda
Now call this method passing third argument as lambda - "in place" function. Please refer to a link provided at the beginning of this chapter.
Write this lambda in three different ways:

- explicit argument type
- implicit argument type
- shortcut form (without argument name)

### Functional Concepts in Swift

#### Exercise 1 -  map / reduce 
a) Rewrite the previous function so it can take a list of numbers instead of only two numbers
b) rewrite the function so it doesn't use `f` explicitely but in a way where it is applayed using `map`
c) Aa a final step remove the for loop completely in favor of `reduce` function that will use `+` operator

#### Exercise 2 - filter
Add a filtering logic using `filter` so only positive numbers are considered.

Then iterate by exposing one more argument in `averageOfFunction`: lambda that will be used to filter elements.
 
#### Function composition
Read about function composition in Swift here: [http://www.objc.io/snippets/2.html](http://www.objc.io/snippets/2.html)

#### Currying
Read about currying in Swift here: [http://www.objc.io/snippets/6.html](http://www.objc.io/snippets/6.html)

### Reference
- [Apple Swift Programming Guided Tour](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html)
- [Functional Programming in Swift](http://www.objc.io/books/)
- [We ❤ Swift](https://www.weheartswift.com/higher-order-functions-map-filter-reduce-and-more/)