import Quick
import Nimble
import TicTacToeCommandLine

class FirstAvailableSpotComputerPlayerTests: QuickSpec {
    override func spec() {
        
        var ai: FirstAvailableSpotComputerPlayer!
        var board: Board!
        
        beforeEach {
            ai = FirstAvailableSpotComputerPlayer()
            board = Board()
        }
        
        describe("filled board") {

            it("returns nil if there are no available spaces") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerTwo)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerTwo)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                expect(ai.getMove(board: board)).to(beNil())
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
                expect(ai.getMove(board: board)).to(equal(1))
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
                expect(ai.getMove(board: board)).to(equal(4))
            }
            
        }
        
        describe("partially filled boards") {
            
            it("takes the first cell if it is open") {
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                expect(ai.getMove(board: board)).to(equal(0))
            }
            
            it("takes the second cell if the first one is taken") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                expect(ai.getMove(board: board)).to(equal(1))
            }
            
            it("takes the next available cell") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                expect(ai.getMove(board: board)).to(equal(3))
            }
            
            it("takes the next available cell, even if it means a loss") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                
                expect(ai.getMove(board: board)).to(equal(1))
            }
            
        }
        
    }
}
