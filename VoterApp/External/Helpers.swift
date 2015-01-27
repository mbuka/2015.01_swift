//
//  Helpers.swift
//  Voter
//
//  Created by Krzysztof Profic on 27/01/15.
//  Copyright (c) 2015 Lambda Academy. All rights reserved.
//

import Foundation

// for testing purposes only
extension Array {
    mutating func addVote(element: T)
    {
        if (self.count < 10) {
            self.append(element)
        }
    }
}
