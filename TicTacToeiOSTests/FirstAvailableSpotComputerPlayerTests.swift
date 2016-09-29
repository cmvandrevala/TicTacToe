import Quick
import Nimble
import TicTacToeiOS

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
                board.move(0, cellStatus: .playerTwo)
                board.move(1, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerTwo)
                board.move(3, cellStatus: .playerTwo)
                board.move(4, cellStatus: .playerOne)
                board.move(5, cellStatus: .playerTwo)
                board.move(6, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerTwo)
                board.move(8, cellStatus: .playerTwo)
                expect(ai.getMove(board)).to(beNil())
            }

        }
        
        describe("the board is almost full") {
            
            it("takes the final unoccupied cell at the end of the game, even if it is a loss") {
                board.move(0, cellStatus: .playerOne)
                board.move(2, cellStatus: .playerOne)
                board.move(3, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerOne)
                board.move(5, cellStatus: .playerOne)
                board.move(6, cellStatus: .playerOne)
                board.move(7, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerOne)
                expect(ai.getMove(board)).to(equal(1))
            }
            
            it("takes the final unoccupied cell at the end of the game if it is a win") {
                board.move(0, cellStatus: .playerTwo)
                board.move(1, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerTwo)
                board.move(3, cellStatus: .playerTwo)
                board.move(5, cellStatus: .playerTwo)
                board.move(6, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerTwo)
                board.move(8, cellStatus: .playerTwo)
                expect(ai.getMove(board)).to(equal(4))
            }
            
        }
        
        describe("partially filled boards") {
            
            it("takes the first cell if it is open") {
                board.move(2, cellStatus: .playerOne)
                board.move(3, cellStatus: .playerTwo)
                board.move(4, cellStatus: .playerOne)
                board.move(6, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerOne)
                expect(ai.getMove(board)).to(equal(0))
            }
            
            it("takes the second cell if the first one is taken") {
                board.move(0, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerTwo)
                board.move(3, cellStatus: .playerOne)
                expect(ai.getMove(board)).to(equal(1))
            }
            
            it("takes the next available cell") {
                board.move(0, cellStatus: .playerTwo)
                board.move(1, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerOne)
                expect(ai.getMove(board)).to(equal(3))
            }
            
            it("takes the next available cell, even if it means a loss") {
                board.move(0, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerOne)
                board.move(5, cellStatus: .playerOne)
                
                expect(ai.getMove(board)).to(equal(1))
            }
            
        }
        
    }
}
