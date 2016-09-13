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
        
        describe("#gameIsOver") {
            
            it("returns true if there is a winner in the top row") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(1, cellStatus: .PlayerOne)
                board.move(2, cellStatus: .PlayerOne)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle row") {
                board.move(3, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerOne)
                board.move(5, cellStatus: .PlayerOne)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the bottom row") {
                board.move(6, cellStatus: .PlayerOne)
                board.move(7, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerOne)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the left column") {
                board.move(0, cellStatus: .PlayerTwo)
                board.move(3, cellStatus: .PlayerTwo)
                board.move(6, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the middle column") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(4, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the right column") {
                board.move(2, cellStatus: .PlayerTwo)
                board.move(5, cellStatus: .PlayerTwo)
                board.move(8, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the first diagonal") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerOne)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if there is a winner in the second diagonal") {
                board.move(2, cellStatus: .PlayerTwo)
                board.move(4, cellStatus: .PlayerTwo)
                board.move(6, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns false if not all of the cells are filled and there is no winner") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(8, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(false))
            }
            
            it("returns true if all of the cells are filled and there is a tie") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerOne)
                board.move(3, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerTwo)
                board.move(5, cellStatus: .PlayerOne)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }
            
            it("returns true if all of the cells are filled and there is a winner") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(1, cellStatus: .PlayerOne)
                board.move(2, cellStatus: .PlayerOne)
                board.move(3, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerTwo)
                board.move(5, cellStatus: .PlayerOne)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.gameIsOver()).to(equal(true))
            }

        }
        
        describe("#currentGameStatus") {
            
            it("returns .PlayerOneWins if player one has a diagonal win") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .PlayerOneWins).to(beTruthy())
            }
            
            it("returns .PlayerTwoWins if player two has a vertical win") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(4, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .PlayerTwoWins).to(beTruthy())
            }
            
            it("returns .Tie if the game has ended in a tie") {
                board.move(0, cellStatus: .PlayerOne)
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerOne)
                board.move(3, cellStatus: .PlayerOne)
                board.move(4, cellStatus: .PlayerTwo)
                board.move(5, cellStatus: .PlayerOne)
                board.move(6, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerOne)
                board.move(8, cellStatus: .PlayerTwo)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .Tie).to(beTruthy())
            }
            
            it("returns .InProgress if the game is still in progress") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerTwo)
                board.move(7, cellStatus: .PlayerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .InProgress).to(beTruthy())
            }
            
        }
        
    }

}
