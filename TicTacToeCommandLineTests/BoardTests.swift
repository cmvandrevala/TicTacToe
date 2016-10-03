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
        
        describe("#rowsOfCells()") {
            
            it("returns empty cells grouped by row if no moves were made") {
                let emptyCells = board.rowsOfCells()
                expect(emptyCells[0]).to(equal( [.empty, .empty, .empty] ))
                expect(emptyCells[1]).to(equal( [.empty, .empty, .empty] ))
                expect(emptyCells[2]).to(equal( [.empty, .empty, .empty] ))
            }
            
            it("returns the proper cells grouped by row if a few moves were made") {
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                let emptyCells = board.rowsOfCells()
                expect(emptyCells[0]).to(equal( [.empty, .empty, .playerTwo] ))
                expect(emptyCells[1]).to(equal( [.playerOne, .empty, .empty] ))
                expect(emptyCells[2]).to(equal( [.empty, .empty, .empty] ))
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
        
        describe("#filledBoard") {
            
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
        
        describe("#emptyCellAtIndex") {
            
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
            
            it("erases all current moves on the board") {
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.clear()
                expect(board.isEmptyCellAtIndex(cellIndex: 1)).to(beTrue())
            }
            
        }

    }
}
