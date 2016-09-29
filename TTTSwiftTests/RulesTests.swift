import Quick
import Nimble
import TTTSwift

class RulesTests: QuickSpec {

    override func spec() {
        
        var rules: Rules!
        var board: Board!
        
        beforeEach {
            board = Board()
            rules = Rules(board: board)
        }
        
        describe("#isGameOver") {
            
            it("returns true if there is a winner in the top row") {
                board.move(0, cellStatus: .playerOne)
                board.move(1, cellStatus: .playerOne)
                board.move(2, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the middle row") {
                board.move(3, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerOne)
                board.move(5, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the bottom row") {
                board.move(6, cellStatus: .playerOne)
                board.move(7, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the left column") {
                board.move(0, cellStatus: .playerTwo)
                board.move(3, cellStatus: .playerTwo)
                board.move(6, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the middle column") {
                board.move(1, cellStatus: .playerTwo)
                board.move(4, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the right column") {
                board.move(2, cellStatus: .playerTwo)
                board.move(5, cellStatus: .playerTwo)
                board.move(8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the first diagonal") {
                board.move(0, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the second diagonal") {
                board.move(2, cellStatus: .playerTwo)
                board.move(4, cellStatus: .playerTwo)
                board.move(6, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns false if not all of the cells are filled and there is no winner") {
                board.move(1, cellStatus: .playerTwo)
                board.move(8, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beFalse())
            }
            
            it("returns true if all of the cells are filled and there is a tie") {
                board.move(0, cellStatus: .playerOne)
                board.move(1, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerOne)
                board.move(3, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerTwo)
                board.move(5, cellStatus: .playerOne)
                board.move(6, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if all of the cells are filled and there is a winner") {
                board.move(0, cellStatus: .playerOne)
                board.move(1, cellStatus: .playerOne)
                board.move(2, cellStatus: .playerOne)
                board.move(3, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerTwo)
                board.move(5, cellStatus: .playerOne)
                board.move(6, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }

        }
        
        describe("#currentGameStatus") {
            
            it("returns .playerOneWins if player one has a diagonal win") {
                board.move(0, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .playerOneWins).to(beTrue())
            }
            
            it("returns .playerTwoWins if player two has a vertical win") {
                board.move(1, cellStatus: .playerTwo)
                board.move(4, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .playerTwoWins).to(beTrue())
            }
            
            it("returns .Tie if the game has ended in a tie") {
                board.move(0, cellStatus: .playerOne)
                board.move(1, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerOne)
                board.move(3, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerTwo)
                board.move(5, cellStatus: .playerOne)
                board.move(6, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .tie).to(beTrue())
            }
            
            it("returns .InProgress if the game is still in progress") {
                board.move(1, cellStatus: .playerTwo)
                board.move(2, cellStatus: .playerTwo)
                board.move(7, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .inProgress).to(beTrue())
            }
            
        }
        
        describe("#clear") {
            
            it("clears the winner of the game") {
                board.move(0, cellStatus: .playerOne)
                board.move(4, cellStatus: .playerOne)
                board.move(8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .playerOneWins).to(beTrue())
                rules.clear()
                expect(rules.currentGameStatus == .inProgress).to(beTrue())
            }
            
        }
        
    }

}
