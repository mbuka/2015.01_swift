//
//  QuickCheck.swift
//  Voter
//
//  Created by Krzysztof Profic on 23/12/14.
//  Copyright (c) 2014 Lambda Academy. All rights reserved.
//

//  Implementation based on QuickCheck by Chris Eidhof from "Functional Programming in Swift"

import Foundation


let numberOfIterations = 10

// QuickCheck type protocols
protocol Smaller {
    func smaller() -> Self?
}

protocol Arbitrary: Smaller {
    class func arbitrary() -> Self
}

func check<X: Arbitrary>(message: String, prop: X -> Bool) -> (Bool) {
    let instance = ArbitraryI(arbitrary: { X.arbitrary() }, smaller: { $0.smaller() })
    return checkHelper(instance, prop, message)
}

func check<X: Arbitrary, Y: Arbitrary>(message: String, prop: (X, Y) -> Bool) -> (Bool) {
    let arbitraryTuple = { (X.arbitrary(), Y.arbitrary()) }
    let smaller: (X, Y) -> (X, Y)? = { (x, y) in
        if let newX = x.smaller() {
            if let newY = y.smaller() {
                return (newX, newY)
            }
        }
        return nil
    }
    
    let instance = ArbitraryI(arbitrary: arbitraryTuple, smaller: smaller)
    return checkHelper(instance, prop, message)
}


//
//  Stuff that may be helpful when you want to add QuickCheck support for a new type
//
struct ArbitraryI<T> {
    let arbitrary: () -> T
    let smaller: T -> T?
}

func checkHelper<A>(arbitraryInstance: ArbitraryI<A>, prop: A -> Bool, message: String) -> (Bool) {
    for _ in 0..<numberOfIterations {
        let value = arbitraryInstance.arbitrary()
        if !prop(value) {
            let smallerValue = iterateWhile({ !prop($0) }, value,
                arbitraryInstance.smaller)
            
            // TODO: how to get this explicit type (Vote) out? 
            if let a = smallerValue as? Array<Vote> {
                print("\"\(message)\" doesn't hold: [")
                for v in a {
                    print(" \(v.description),")
                }
                println("]")
            }
            else {
                println("\"\(message)\" doesn't hold: \(smallerValue)")
            }
            return false
        }
    }
    println("\"\(message)\" passed \(numberOfIterations) tests.")
    return true
}
