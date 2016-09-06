//
//  BoardTests.swift
//  TTTSwift
//
//  Created by Cyrus Vandrevala on 9/6/16.
//  Copyright © 2016 Cyrus Vandrevala. All rights reserved.
//

import Quick
import Nimble

@testable import TTTSwift

class BoardTests: QuickSpec {
    override func spec() {
        describe("the initial board") {
            
            it("has nine cells") {
                let board = Board()
                expect(board.marks.count).to(equal(9))
            }
            
            it("the cells have a default mark of nil") {
                let board = Board()
                expect(board.marks).to(equal([nil, nil, nil, nil, nil, nil, nil, nil, nil]))
            }
            
            it("a cell can be taken by player 1") {
                let board = Board()
                board.move(1, space: 5)
                expect(board.marks).to(equal([nil, nil, nil, nil, 1, nil, nil, nil, nil]))
            }
            
            it("multiple cells can be taken by player 1") {
                let board = Board()
                board.move(1, space: 1)
                board.move(1, space: 3)
                board.move(1, space: 8)
                expect(board.marks).to(equal([1, nil, 1, nil, nil, nil, nil, 1, nil]))
            }
            
            it("a cell can be taken by player 2") {
                let board = Board()
                board.move(2, space: 9)
                expect(board.marks).to(equal([nil, nil, nil, nil, nil, nil, nil, nil, 2]))
            }
            
            it("multiple cells can be taken by multiple players") {
                let board = Board()
                board.move(1, space: 3)
                board.move(2, space: 4)
                expect(board.marks).to(equal([nil, nil, 1, 2, nil, nil, nil, nil, nil]))
            }
            
            it("rejects a move in a taken spot by the same player") {
                let board = Board()
                board.move(1, space: 5)
                board.move(1, space: 5)
                expect(board.marks).to(equal([nil, nil, nil, nil, 1, nil, nil, nil, nil]))
            }
            
            it("rejects a move in a taken spot by a different player") {
                let board = Board()
                board.move(1, space: 5)
                board.move(2, space: 5)
                expect(board.marks).to(equal([nil, nil, nil, nil, 1, nil, nil, nil, nil]))
            }

        }
    }
}
