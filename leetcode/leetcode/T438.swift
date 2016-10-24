//
//  T438.swift
//  leetcode solution
//
//  Created by Lan Xiao on 24/10/2016.
//
//

import XCTest
import Nimble

class T438: XCTestCase {

    let sut = Q438()

    func testExample() {
        let s = "cbaebabacd", p = "abc"
        let e = [0, 6]

        let ans = sut.findAnagrams(s, p)
        
        expect(ans).to(equal(e))
    }

}
