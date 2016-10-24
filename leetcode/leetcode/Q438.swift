//
//  Q438.swift
//  leetcode solution
//
//  Created by Lan Xiao on 24/10/2016.
//
//

import Foundation

class Q438 {

    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let windowSize = p.characters.count
        guard windowSize > 0 else {
            return [Int]()
        }

        var characterCounts = [Int]()
        for _ in 1...26 {
            characterCounts.append(0)
        }

        for char in p.characters {
            let distance = getDistance(of: char)
            characterCounts[distance] += 1
        }

        var validStarts = [Int]()
        for (index, char) in s.characters.enumerated() {
            let distance = getDistance(of: char)
            characterCounts[distance] -= 1

            let start = index - windowSize + 1
            guard start >= 0 else {
                continue
            }

            if characterCounts.filter({ $0 > 0 }).isEmpty {
                validStarts.append(start)
            }

            let headCharacter = s[s.index(s.startIndex, offsetBy: start)]
            let headCharacterDistance = getDistance(of: headCharacter)
            characterCounts[headCharacterDistance] += 1
        }

        return validStarts
    }

    private func getDistance(of char: Character, from origin: Character = "a") -> Int {
        let charAscii = Int(String(char).unicodeScalars.first!.value)
        let originAscii = Int(String(origin).unicodeScalars.first!.value)
        return charAscii - originAscii
    }
}
