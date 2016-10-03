import Quick
import Nimble
import TicTacToeCommandLine

class RandomSpotComputerPlayerTests: QuickSpec {
    override func spec() {
        
        var ai: RandomSpotComputerPlayer!
        var board: Board!
        
        beforeEach {
            ai = RandomSpotComputerPlayer()
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
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerOne)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                expect(ai.getMove(board: board)).to(equal(2))
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
            
            it("takes a spot that is not filled") {
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                expect(ai.getMove(board: board)).toNot(equal(2))
                expect(ai.getMove(board: board)).toNot(equal(3))
                expect(ai.getMove(board: board)).toNot(equal(4))
                expect(ai.getMove(board: board)).toNot(equal(6))
                expect(ai.getMove(board: board)).toNot(equal(7))
            }
            
        }
        
    }
}
