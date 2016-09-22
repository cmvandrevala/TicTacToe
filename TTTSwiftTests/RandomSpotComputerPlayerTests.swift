import Quick
import Nimble
import TTTSwift

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
                board.move(0, cellStatus: .PlayerTwo)
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerTwo)
                board.move(3, cellStatus: .PlayerTwo)
                board.move(4, cellStatus: .PlayerOne)
                board.move(5, cellStatus: .PlayerTwo)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerTwo)
                board.move(8, cellStatus: .PlayerTwo)
                expect(ai.getMove(board)).to(beNil())
            }
            
        }
        
        describe("the board is almost full") {
            
            it("takes the final unoccupied cell at the end of the game, even if it is a loss") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(1, cellStatus: .PlayerOne)
                board.move(3, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerOne)
                board.move(5, cellStatus: .PlayerOne)
                board.move(6, cellStatus: .PlayerOne)
                board.move(7, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerOne)
                expect(ai.getMove(board)).to(equal(2))
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
                expect(ai.getMove(board)).to(equal(4))
            }
            
        }
        
        describe("partially filled boards") {
            
            it("takes a spot that is not filled") {
                board.move(2, cellStatus: .PlayerOne)
                board.move(3, cellStatus: .PlayerTwo)
                board.move(4, cellStatus: .PlayerOne)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerOne)
                expect(ai.getMove(board)).toNot(equal(2))
                expect(ai.getMove(board)).toNot(equal(3))
                expect(ai.getMove(board)).toNot(equal(4))
                expect(ai.getMove(board)).toNot(equal(6))
                expect(ai.getMove(board)).toNot(equal(7))
            }
            
        }
        
    }
}
