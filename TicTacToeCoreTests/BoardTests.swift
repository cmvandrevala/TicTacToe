import Quick
import Nimble
import TicTacToeCommandLine

class BoardTests: QuickSpec {
    override func spec() {
        var board: Board!
        
        beforeEach {
            board = Board()
        }

        describe("#currentBoard and #move") {
            
            it("starts off with nine empty cells") {
                expect(board.currentBoard()).to(equal([.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]))
            }
            
            it("allows a move at index 0") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                expect(board.currentBoard()).to(equal([.playerOne, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]))
            }
            
            it("allows a move at index 8") {
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                expect(board.currentBoard()).to(equal([.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .playerTwo]))
            }
            
            it("a cell can be taken by .playerOne") {
                board.move(cellIndex: 5, cellStatus: .playerOne)
                expect(board.currentBoard()).to(equal([.empty, .empty, .empty, .empty, .empty, .playerOne, .empty, .empty, .empty]))
            }
            
            it("a cell can be taken by .playerTwo") {
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                expect(board.currentBoard()).to(equal([.empty, .empty, .playerTwo, .empty, .empty, .empty, .empty, .empty, .empty]))
            }
            
            it("multiple cells can be taken by .playerOne and .playerTwo") {
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                expect(board.currentBoard()).to(equal([.playerTwo, .playerTwo, .playerOne, .empty, .empty, .empty, .empty, .empty, .empty]))
            }

        }
        
        describe("returning a board in JSON format via #currentBoardJSON") {
            
            it("starts off with nine empty cells") {
                expect(board.currentBoardJSON()).to(equal("{\"moves\": []}"))
            }
            
            it("returns a move at index 0 by player one") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                expect(board.currentBoardJSON()).to(equal("{\"moves\": [{\"player_one\": 0}]}"))
            }
            
            it("returns a move at index 2 by player two") {
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                expect(board.currentBoardJSON()).to(equal("{\"moves\": [{\"player_two\": 2}]}"))
            }
            
            it("multiple cells can be taken by player one and player two") {
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                expect(board.currentBoardJSON()).to(equal("{\"moves\": [{\"player_two\": 0}, {\"player_two\": 1}, {\"player_one\": 2}]}"))
            }
            
        }
        
        describe("#threeInRow") {
            var board: Board!
            
            beforeEach {
                board = Board()
            }
            
            it("returns .empty if the board is completely filled with empty spaces") {
                expect(board.threeInRow() == .empty).to(beTruthy())
            }
            
            it("returns .playerTwo if player two wins in the right column") {
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 5, cellStatus: .playerTwo)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                expect(board.threeInRow() == .playerTwo).to(beTruthy())
            }
            
        }
        
        describe("#isFilled") {
            
            it("returns false if the board is completely filled with empty spaces") {
                expect(board.isFilled()).to(beFalse())
            }
            
            it("returns false if not all of the cells are filled") {
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerTwo)
                expect(board.isFilled()).to(beFalse())
            }
            
            it("returns true if the board is completely filled") {
                for i in 0...8 {
                    board.move(cellIndex: i, cellStatus: .playerOne)
                }
                expect(board.isFilled()).to(beTrue())
            }
            
        }
        
        describe("#isEmptyAtIndex") {
            
            it("returns false if the cell is taken by player one") {
                board.move(cellIndex: 1, cellStatus: .playerOne)
                expect(board.isEmptyCellAtIndex(cellIndex: 1)).to(beFalse())
            }
            
            it("returns false if the cell is taken by player two") {
                board.move(cellIndex: 7, cellStatus: .playerTwo)
                expect(board.isEmptyCellAtIndex(cellIndex: 7)).to(beFalse())
            }
            
            it("returns true if the cell is empty") {
                expect(board.isEmptyCellAtIndex(cellIndex: 6)).to(beTrue())
            }
            
        }
        
        describe("#clear") {
            
            it("does nothing to an empty board") {
                board.clear()
                for i in 0...8 {
                    expect(board.isEmptyCellAtIndex(cellIndex: i)).to(beTrue())
                }
            }

            it("erases all current moves on the board") {
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.clear()
                expect(board.isEmptyCellAtIndex(cellIndex: 1)).to(beTrue())
            }
            
        }

        describe("initializing the board") {

            it("contains nine cells") {
                expect(board.numberOfCells).to(equal(9))
            }

        }

    }
}
