import Quick
import Nimble
import TicTacToeCommandLine

class FirstAvailableSpotComputerPlayerTests: QuickSpec {
    override func spec() {
        
        var ai: FirstAvailableSpotComputerPlayer!
        var board: Board!
        var game: Game!
        
        beforeEach {
            ai = FirstAvailableSpotComputerPlayer()
            board = Board()
            game = Game(board: board)
        }
        
        describe("filled board") {

            describe("filled board") {
                
                it("does nothing if the board is filled") {
                    board.move(cellIndex: 0, cellStatus: .playerTwo)
                    board.move(cellIndex: 1, cellStatus: .playerTwo)
                    board.move(cellIndex: 2, cellStatus: .playerTwo)
                    board.move(cellIndex: 3, cellStatus: .playerTwo)
                    board.move(cellIndex: 4, cellStatus: .playerOne)
                    board.move(cellIndex: 5, cellStatus: .playerTwo)
                    board.move(cellIndex: 6, cellStatus: .playerTwo)
                    board.move(cellIndex: 7, cellStatus: .playerTwo)
                    board.move(cellIndex: 8, cellStatus: .playerTwo)
                    ai.makeMove(game: game)
                    expect(board.isFilled()).to(beTruthy())
                }
                
            }

        }
        
        describe("the board is almost full") {
            
            it("takes the final unoccupied cell at the end of the game, even if it is a loss") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerOne)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                ai.makeMove(game: game)
                expect(board.isFilled()).to(beTruthy())
            }
            
            it("takes the final unoccupied cell at the end of the game if it is a win") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 5, cellStatus: .playerTwo)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerTwo)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                ai.makeMove(game: game)
                expect(board.isFilled()).to(beTruthy())
            }
            
        }
        
        describe("partially filled boards") {
            
            it("takes the first cell if it is open") {
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                ai.makeMove(game: game)
                expect(board.isEmptyCellAtIndex(cellIndex: 0)).to(beFalsy())
            }
            
            it("takes the second cell if the first one is taken") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                ai.makeMove(game: game)
                expect(board.isEmptyCellAtIndex(cellIndex: 1)).to(beFalsy())
            }
            
            it("takes the next available cell") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                ai.makeMove(game: game)
                expect(board.isEmptyCellAtIndex(cellIndex: 3)).to(beFalsy())
            }
            
            it("takes the next available cell, even if it means a loss") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                ai.makeMove(game: game)
                expect(board.isEmptyCellAtIndex(cellIndex: 1)).to(beFalsy())
            }
            
        }
        
    }
}
