//
//  RulesTests.swift
//  TTTSwift
//
//  Created by Cyrus Vandrevala on 9/7/16.
//  Copyright © 2016 Cyrus Vandrevala. All rights reserved.
//

import Quick
import Nimble
import TTTSwift

class RulesTests: QuickSpec {

    override func spec() {

        describe("winner exists") {

            var rules: Rules!
            
            beforeEach {
                rules = Rules()
            }
        
            it("returns false if there is no winner") {
                let current_marks = ["a", "", "c", "x", "x", "", "", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(false))
            }
            
            it("returns true if there is a winner in the top row") {
                let current_marks = ["x", "x", "x", "y", "x", "", "", "o", "2"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle row") {
                let current_marks = ["", "", "z", "z", "z", "z", "o", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the bottom row") {
                let current_marks = ["", "", "z", "z", "", "v", "v", "v", "v"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the left column") {
                let current_marks = ["55", "", "", "55", "", "", "55", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle column") {
                let current_marks = ["", "O", "", "", "O", "", "", "O", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the right column") {
                let current_marks = ["", "", ":)", "", "", ":)", "", "", ":)"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the first diagonal") {
                let current_marks = ["A", "", "", "", "A", ":)", "B", "", "A"]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a winner in the second diagonal") {
                let current_marks = ["", "C", "B", "", "B", "C", "B", "", ""]
                expect(rules.winnerExists(current_marks)).to(equal(true))
            }
            
            
        }
        
        describe("tie exists") {

            var rules: Rules!
            
            beforeEach {
                rules = Rules()
            }
            
            it("returns false if not all of the cells are filled") {
                let current_marks = ["", "X", "X", "", "X", "", "", "", ""]
                expect(rules.tieExists(current_marks)).to(equal(false))
            }
            
            it("returns true if all of the cells are filled and there is a tie") {
                let current_marks = ["O", "X", "O", "O", "X", "O", "X", "O", "X"]
                expect(rules.tieExists(current_marks)).to(equal(true))
            }
            
            it("returns false if not all of the cells are filled and there is a winner") {
                let current_marks = ["X", "X", "X", "", "", "", "", "", ""]
                expect(rules.tieExists(current_marks)).to(equal(false))
            }
            
            it("returns false if all of the cells are filled and there is a winner") {
                let current_marks = ["X", "X", "X", "A", "B", "C", "D", "E", "F"]
                expect(rules.tieExists(current_marks)).to(equal(false))
            }
            
        }
        
        describe("game is over") {
            
            var rules: Rules!
            
            beforeEach {
                rules = Rules()
            }
            
            it("returns true if there is a winner") {
                let current_marks = ["X", "X", "", "", "X", "", "O", "O", "X"]
                expect(rules.gameIsOver(current_marks)).to(equal(true))
            }
            
            it("returns true if there is a tie") {
                let current_marks = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]
                expect(rules.gameIsOver(current_marks)).to(equal(true))
            }
            
            it("returns false if the game is still continuing") {
                let current_marks = ["", "O", "X", "", "O", "X", "", "X", "O"]
                expect(rules.gameIsOver(current_marks)).to(equal(false))
            }
        }
        
    }

}
