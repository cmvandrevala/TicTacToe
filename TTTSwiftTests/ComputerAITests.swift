import Quick
import Nimble
import TTTSwift

class ComputerAITests: QuickSpec {
    override func spec() {
        
        var ai: ComputerAI!
        var board: Board!
        
        beforeEach {
            ai = ComputerAI()
            board = Board()
        }
        
        describe("the board is full") {

            it("returns nil if there are no available spaces") {
                board.move(0, cellStatus: .PlayerTwo)
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerTwo)
                board.move(3, cellStatus: .PlayerTwo)
                board.move(4, cellStatus: .PlayerOne)
                board.move(5, cellStatus: .PlayerTwo)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerTwo)
                board.move(8, cellStatus: .PlayerTwo)
                expect(ai.move(board)).to(beNil())
            }

        }
        
        describe("board is almost full") {
            
            it("takes the final unoccupied cell at the end of the game, even if it is a loss") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(2, cellStatus: .PlayerOne)
                board.move(3, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerOne)
                board.move(5, cellStatus: .PlayerOne)
                board.move(6, cellStatus: .PlayerOne)
                board.move(7, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerOne)
                expect(ai.move(board)).to(equal(1))
            }
            
            it("takes the final unoccupied cell at the end of the game if it is a win") {
                board.move(0, cellStatus: .PlayerTwo)
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerTwo)
                board.move(3, cellStatus: .PlayerTwo)
                board.move(5, cellStatus: .PlayerTwo)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerTwo)
                board.move(8, cellStatus: .PlayerTwo)
                expect(ai.move(board)).to(equal(4))
            }
            
        }
        
    }
}
