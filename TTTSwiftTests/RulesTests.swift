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
                board.move(0, player: "x")
                board.move(1, player: "x")
                board.move(2, player: "x")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle row") {
                board.move(3, player: "z")
                board.move(4, player: "z")
                board.move(5, player: "z")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the bottom row") {
                board.move(6, player: "z")
                board.move(7, player: "z")
                board.move(8, player: "z")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the left column") {
                board.move(0, player: "a")
                board.move(3, player: "a")
                board.move(6, player: "a")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle column") {
                board.move(1, player: "a")
                board.move(4, player: "a")
                board.move(7, player: "a")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the right column") {
                board.move(2, player: "a")
                board.move(5, player: "a")
                board.move(8, player: "a")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the first diagonal") {
                board.move(0, player: "b")
                board.move(4, player: "b")
                board.move(8, player: "b")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if there is a winner in the second diagonal") {
                board.move(2, player: "o")
                board.move(4, player: "o")
                board.move(6, player: "o")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns false if not all of the cells are filled and there is no winner") {
                board.move(1, player: "a")
                board.move(8, player: "b")
                board.move(4, player: "c")
                expect(rules.gameIsOver(board)).to(equal(false))
            }
            
            it("returns true if all of the cells are filled and there is a tie") {
                board.move(0, player: "x")
                board.move(1, player: "o")
                board.move(2, player: "x")
                board.move(3, player: "x")
                board.move(4, player: "o")
                board.move(5, player: "x")
                board.move(6, player: "o")
                board.move(7, player: "x")
                board.move(8, player: "o")
                expect(rules.gameIsOver(board)).to(equal(true))
            }
            
            it("returns true if all of the cells are filled and there is a winner") {
                board.move(0, player: "x")
                board.move(1, player: "x")
                board.move(2, player: "x")
                board.move(3, player: "x")
                board.move(4, player: "o")
                board.move(5, player: "x")
                board.move(6, player: "o")
                board.move(7, player: "x")
                board.move(8, player: "o")
                expect(rules.gameIsOver(board)).to(equal(true))
            }

        }
        
    }

}
