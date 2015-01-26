//
// Lambda Academy 2015.01 Lecture 1
//

import Foundation

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

averageSumOfCubes(3, 4)
averageSumOfSquares(3, 4)


// Excersise 1

func averageOfFunction(a:Float,b:Float,f:(Float -> Float)) -> Float {
    return (f(a) + f(b)) / 2
}


averageOfFunction(3, 4, cube)
averageOfFunction(3, 4, square)

// Excersise 2 - Lambda

// explicit argument type
var res = averageOfFunction(3, 4, {(x: Float) in return x*x} )
print(res)

res = averageOfFunction(3, 4, {(x: Float) in return x*x*x} )
print(res)

//implicit argument type

res = averageOfFunction(3, 4, {x in return x*x} )
print(res)

res = averageOfFunction(3, 4, {x in return x*x*x} )
print(res)

//shortcut form (without argument name)
res = averageOfFunction(3, 4, {$0*$0} )
print(res)

res = averageOfFunction(3, 4, {$0*$0*$0} )
print(res)



// Functional Concepts

// map reduce
func averageOfFunction1(numbers: [Float],f:(Float -> Float)) -> Float  {
    var sum : Float = 0
    for a in numbers {
        let transformed = f(a)
        sum += transformed
    }
    let avrg = sum / Float(numbers.count)
    return avrg
}

func averageOfFunction2(numbers: [Float],f:(Float -> Float)) -> Float  {
    let transformed = numbers.map(f)
    let sum = transformed.reduce(0, combine:+)
    let avrg = sum/Float(numbers.count)
    return avrg
}

func averageOfFunction3(numbers: [Float],f:(Float -> Float)) -> Float  {
    return numbers.map(f).reduce(0, combine: +) / Float(numbers.count)
}

func averageOfFunction4(numbers: [Float],f:(Float -> Float), filter: (Float -> Bool)) -> Float  {
    let filtered = numbers.filter(filter)
    return filtered.map(f).reduce(0, combine: +) / Float(filtered.count)
}

let a = averageOfFunction3([3, 4], {$0*$0})
print(a)

let b = averageOfFunction4([3, 4, -1], {$0*$0}, {$0>0})
print(b)