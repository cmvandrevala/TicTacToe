//
//  Rules.swift
//  TTTSwift
//
//  Created by Cyrus Vandrevala on 9/7/16.
//  Copyright © 2016 Cyrus Vandrevala. All rights reserved.
//

class Rules {
    
    func winnerExists(currentMarks: [String]) -> Bool {
        for combo in winningCombinations() {
            if marksMatchCombo(currentMarks, potentialCombination: combo) {
                return true
            }
        }
        return false
    }
    
    private func marksMatchCombo(currentMarks: [String], potentialCombination: [Int]) -> Bool {
        let triplet = setOfThreeMarks(currentMarks, potentialCombination: potentialCombination)
        if containsEmptyCells(triplet) {
            return false
        } else if marksAreAllEqual(triplet) {
            return true
        } else {
            return false
        }
    }
    
    private func setOfThreeMarks(currentMarks: [String], potentialCombination: [Int]) -> [String] {
        let first_mark = currentMarks[potentialCombination[0]]
        let second_mark = currentMarks[potentialCombination[1]]
        let third_mark = currentMarks[potentialCombination[2]]
        return [first_mark, second_mark, third_mark]
    }
    
    private func containsEmptyCells(marks: [String]) -> Bool {
        if marks.contains("") {
            return true
        } else {
            return false
        }
    }
    
    private func marksAreAllEqual(marks: [String]) -> Bool {
        if Array(Set(marks)).count == 1 {
            return true
        } else {
            return false
        }
    }

    private func winningCombinations() -> [[Int]] {
        return [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                 [0, 3, 6], [1, 4, 7], [2, 5, 8],
                 [0, 4, 8], [2, 4, 6] ]
    }
    
}
