import Quick
import Nimble
import TTTSwift

class RulesTests: QuickSpec {

    override func spec() {
        
        describe("gameIsOver") {
            
            var rules: Rules!
            var board: Board!
            
            beforeEach {
                rules = Rules()
                board = Board()
            }
            
            it("returns true if there is a winner in the top row") {
                board.move(0, player: .PlayerOne)
                board.move(1, player: .PlayerOne)
                board.move(2, player: .PlayerOne)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle row") {
                board.move(3, player: .PlayerOne)
                board.move(4, player: .PlayerOne)
                board.move(5, player: .PlayerOne)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the bottom row") {
                board.move(6, player: .PlayerOne)
                board.move(7, player: .PlayerOne)
                board.move(8, player: .PlayerOne)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the left column") {
                board.move(0, player: .PlayerTwo)
                board.move(3, player: .PlayerTwo)
                board.move(6, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle column") {
                board.move(1, player: .PlayerTwo)
                board.move(4, player: .PlayerTwo)
                board.move(7, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the right column") {
                board.move(2, player: .PlayerTwo)
                board.move(5, player: .PlayerTwo)
                board.move(8, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the first diagonal") {
                board.move(0, player: .PlayerOne)
                board.move(4, player: .PlayerOne)
                board.move(8, player: .PlayerOne)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the second diagonal") {
                board.move(2, player: .PlayerTwo)
                board.move(4, player: .PlayerTwo)
                board.move(6, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns false if not all of the cells are filled and there is no winner") {
                board.move(1, player: .PlayerTwo)
                board.move(8, player: .PlayerOne)
                board.move(4, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(false))
            }
            
            it("returns true if all of the cells are filled and there is a tie") {
                board.move(0, player: .PlayerOne)
                board.move(1, player: .PlayerTwo)
                board.move(2, player: .PlayerOne)
                board.move(3, player: .PlayerOne)
                board.move(4, player: .PlayerTwo)
                board.move(5, player: .PlayerOne)
                board.move(6, player: .PlayerTwo)
                board.move(7, player: .PlayerOne)
                board.move(8, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if all of the cells are filled and there is a winner") {
                board.move(0, player: .PlayerOne)
                board.move(1, player: .PlayerOne)
                board.move(2, player: .PlayerOne)
                board.move(3, player: .PlayerOne)
                board.move(4, player: .PlayerTwo)
                board.move(5, player: .PlayerOne)
                board.move(6, player: .PlayerTwo)
                board.move(7, player: .PlayerOne)
                board.move(8, player: .PlayerTwo)
                expect(rules.gameIsOver(board)).to(equal(true))
            }

        }
        
    }

}
