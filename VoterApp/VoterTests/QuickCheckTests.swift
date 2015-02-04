//
//  QuickCheckTests.swift
//  Voter
//
//  Created by Krzysztof Profic on 27/01/15.
//  Copyright (c) 2015 Lambda Academy. All rights reserved.
//

import XCTest



// Check calls check withing assertion clausure
func Check<X: Arbitrary>(prop: X -> Bool, desc: String) {
    XCTAssert(check(desc, prop), desc)
}

func Check<X: Arbitrary, Y: Arbitrary>(prop: (X, Y) -> Bool, desc: String) {
    XCTAssert(check(desc, prop), desc)
}

func Check<X: Arbitrary>(prop: [X] -> Bool, desc: String) {
    XCTAssert(check(desc, prop), desc)
}

extension Vote: Arbitrary{
    static func arbitrary() -> Vote {
        let rand = arc4random() % 3;
        switch(rand){
        case 0:
            return Vote.Hate
        case 1:
            return Vote.Like
        case 2:
            return Vote.Neutral
        default:
            return Vote.Neutral
        }
    }
    
    func smaller() -> Vote? { return nil }
}


class QuickCheckTests: XCTestCase {
    func testMath() {
        Check(plusIsCommutative, "Error in plus")
    }
    
    func testVoteManagerMedian() {
        Check(voteManagerReturnsNones, "Error in none median")
    }
    
}

func plusIsCommutative(x: Int, y: Int) -> Bool {
    return x + y == y + x
}



func voteManagerReturnsNones(voteArray: Array<Vote>) -> Bool{
    return true
}


