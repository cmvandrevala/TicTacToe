import Quick
import Nimble
import TTTSwift

class BoardTests: QuickSpec {
    override func spec() {
        var board: Board!
        
        beforeEach {
            board = Board()
        }

        describe("#currentBoard and #move") {
            
            it("starts off with nine empty cells") {
                expect(board.currentBoard()).to(equal([.Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty]))
            }
            
            it("allows a move at index 0") {
                board.move(0, cellStatus: .PlayerOne)
                expect(board.currentBoard()).to(equal([.PlayerOne, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty]))
            }
            
            it("allows a move at index 8") {
                board.move(8, cellStatus: .PlayerTwo)
                expect(board.currentBoard()).to(equal([.Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .PlayerTwo]))
            }
            
            it("a cell can be taken by .PlayerOne") {
                board.move(5, cellStatus: .PlayerOne)
                expect(board.currentBoard()).to(equal([.Empty, .Empty, .Empty, .Empty, .Empty, .PlayerOne, .Empty, .Empty, .Empty]))
            }
            
            it("a cell can be taken by .PlayerTwo") {
                board.move(2, cellStatus: .PlayerTwo)
                expect(board.currentBoard()).to(equal([.Empty, .Empty, .PlayerTwo, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty]))
            }
            
            it("multiple cells can be taken by .PlayerOne and .PlayerTwo") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerOne)
                board.move(0, cellStatus: .PlayerTwo)
                expect(board.currentBoard()).to(equal([.PlayerTwo, .PlayerTwo, .PlayerOne, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty]))
            }

        }
        
        describe("#rowsOfCells()") {
            
            it("returns empty cells grouped by row if no moves were made") {
                let emptyCells = board.rowsOfCells()
                expect(emptyCells[0]).to(equal( [.Empty, .Empty, .Empty] ))
                expect(emptyCells[1]).to(equal( [.Empty, .Empty, .Empty] ))
                expect(emptyCells[2]).to(equal( [.Empty, .Empty, .Empty] ))
            }
            
            it("returns the proper cells grouped by row if a few moves were made") {
                board.move(2, cellStatus: .PlayerTwo)
                board.move(3, cellStatus: .PlayerOne)
                let emptyCells = board.rowsOfCells()
                expect(emptyCells[0]).to(equal( [.Empty, .Empty, .PlayerTwo] ))
                expect(emptyCells[1]).to(equal( [.PlayerOne, .Empty, .Empty] ))
                expect(emptyCells[2]).to(equal( [.Empty, .Empty, .Empty] ))
            }
            
        }
        
        describe("#threeInRow") {
            var board: Board!
            
            beforeEach {
                board = Board()
            }
            
            it("returns .Empty if the board is completely filled with empty spaces") {
                expect(board.threeInRow() == .Empty).to(beTruthy())
            }
            
            it("returns .PlayerTwo if player two wins in the right column") {
                board.move(2, cellStatus: .PlayerTwo)
                board.move(5, cellStatus: .PlayerTwo)
                board.move(8, cellStatus: .PlayerTwo)
                expect(board.threeInRow() == .PlayerTwo).to(beTruthy())
            }
            
        }
        
        describe("#filledBoard") {
            
            it("returns false if the board is completely filled with empty spaces") {
                expect(board.isFilled()).to(equal(false))
            }
            
            it("returns false if not all of the cells are filled") {
                board.move(1, cellStatus: .PlayerOne)
                board.move(5, cellStatus: .PlayerTwo)
                expect(board.isFilled()).to(equal(false))
            }
            
            it("returns true if the board is completely filled") {
                for i in 0...8 {
                    board.move(i, cellStatus: .PlayerOne)
                }
                expect(board.isFilled()).to(equal(true))
            }
            
        }
        
        describe("#emptyCellAtIndex") {
            
            it("returns false if the cell is taken by player one") {
                board.move(1, cellStatus: .PlayerOne)
                expect(board.isEmptyCellAtIndex(1)).to(equal(false))
            }
            
            it("returns false if the cell is taken by player two") {
                board.move(7, cellStatus: .PlayerTwo)
                expect(board.isEmptyCellAtIndex(7)).to(equal(false))
            }
            
            it("returns true if the cell is empty") {
                expect(board.isEmptyCellAtIndex(6)).to(equal(true))
            }
            
        }

    }
}
