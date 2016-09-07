//
//  RulesTests.swift
//  TTTSwift
//
//  Created by Cyrus Vandrevala on 9/7/16.
//  Copyright © 2016 Cyrus Vandrevala. All rights reserved.
//

import Quick
import Nimble

@testable import TTTSwift

class RulesTests: QuickSpec {
    override func spec() {
        describe("winner of tic tac toe") {
        
            it("returns false if there is no winner") {
                let rules = Rules()
                let current_marks = ["a", "", "c", "x", "x", "", "", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(false))
            }
            
            it("returns true if there is a winner in the top row") {
                let rules = Rules()
                let current_marks = ["x", "x", "x", "y", "x", "", "", "o", "2"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle row") {
                let rules = Rules()
                let current_marks = ["", "", "z", "z", "z", "z", "o", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the bottom row") {
                let rules = Rules()
                let current_marks = ["", "", "z", "z", "", "v", "v", "v", "v"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the left column") {
                let rules = Rules()
                let current_marks = ["55", "", "", "55", "", "", "55", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle column") {
                let rules = Rules()
                let current_marks = ["", "O", "", "", "O", "", "", "O", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the right column") {
                let rules = Rules()
                let current_marks = ["", "", ":)", "", "", ":)", "", "", ":)"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the first diagonal") {
                let rules = Rules()
                let current_marks = ["A", "", "", "", "A", ":)", "B", "", "A"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the second diagonal") {
                let rules = Rules()
                let current_marks = ["", "C", "B", "", "B", "C", "B", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            
        }
    }
}
