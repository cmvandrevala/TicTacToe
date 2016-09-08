//
//  BoardTests.swift
//  TTTSwift
//
//  Created by Cyrus Vandrevala on 9/6/16.
//  Copyright © 2016 Cyrus Vandrevala. All rights reserved.
//

import Quick
import Nimble
import TTTSwift

class BoardTests: QuickSpec {
    override func spec() {
        describe("the board") {
            
            it("starts off with no recorded marks") {
                let board = Board()
                let noMarks = ["", "", "", "", "", "", "", "", ""]
                expect(board.current_marks()).to(equal(noMarks))
            }
            
            it("a cell can be taken by 'player 1'") {
                let board = Board()
                board.move(5, player: "player 1")
                expect(board.current_marks()).to(equal(["", "", "", "", "", "player 1", "", "", ""]))
            }
            
            it("a cell can be taken by 'player two'") {
                let board = Board()
                board.move(2, player: "player two")
                expect(board.current_marks()).to(equal(["", "", "player two", "", "", "", "", "", ""]))
            }
            
            it("multiple cells can be taken by multiple players") {
                let board = Board()
                board.move(1, player: "p1")
                board.move(2, player: "p2")
                board.move(3, player: "p3")
                expect(board.current_marks()).to(equal(["", "p1", "p2", "p3", "", "", "", "", ""]))
            }
            
            it("does not allow players to make moves in the same spot twice") {
                let board = Board()
                board.move(7, player: "X")
                board.move(7, player: "O")
                expect(board.current_marks()).to(equal(["", "", "", "", "", "", "", "X", ""]))
            }
            
            it("does not allow a move in an index greater than 8") {
                let board = Board()
                let noMarks = ["", "", "", "", "", "", "", "", ""]
                board.move(14, player: "Happy")
                expect(board.current_marks()).to(equal(noMarks))
            }
            
            it("does not allow a move in an index less than 0") {
                let board = Board()
                let noMarks = ["", "", "", "", "", "", "", "", ""]
                board.move(-1, player: "Sad")
                expect(board.current_marks()).to(equal(noMarks))
            }

        }
    }
}
