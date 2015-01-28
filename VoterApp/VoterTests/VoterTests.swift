//
//  VoterTests.swift
//  VoterTests
//
//  Created by Krzysztof Profic on 14/12/14.
//  Copyright (c) 2014 Lambda Academy. All rights reserved.
//

import UIKit
import XCTest

class VoterTests: XCTestCase {
    
    func testMath() {
        XCTAssert(1+1==2, "we can't do math?")
    }
    
    func testVoteManagerAccumulatesVotes() {
        let vm = VoteManager()
        
        var votes: [Vote] = []
        XCTAssert(equal(votes, vm.votes), "Casted and recieved vote arrays are not equal")
        
        votes = [Vote.Like, Vote.Like, Vote.Hate, Vote.Neutral]
        for v in votes {
            vm.makeVote(v)
        }
        println("votes: \(vm.votes)")
        XCTAssert(equal(votes, vm.votes), "Casted and recieved vote arrays are not equal")
    }
    
    func testVoteManagerMedian() {
        var vm = VoteManager()
        XCTAssert(vm.median == Vote.None, "An empty Vote manager should return None as median")
        
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Neutral)
        vm.makeVote(Vote.Like)
        XCTAssert(vm.median == Vote.Like, "It should be Like here")
        
        vm = VoteManager()
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Hate)
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Hate)
        vm.makeVote(Vote.Hate)
        XCTAssert(vm.median == Vote.Hate, "It should be Hate here")
        
        vm = VoteManager()
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Neutral)
        vm.makeVote(Vote.Neutral)
        vm.makeVote(Vote.Neutral)
        vm.makeVote(Vote.Like)
        vm.makeVote(Vote.Neutral)
        vm.makeVote(Vote.Neutral)
        XCTAssert(vm.median == Vote.Neutral, "It should be Netural here")
    }
}
