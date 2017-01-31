import Quick
import Nimble
import TicTacToeCommandLine

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
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the middle row") {
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the bottom row") {
                board.move(cellIndex: 6, cellStatus: .playerOne)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the left column") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the middle column") {
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the right column") {
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 5, cellStatus: .playerTwo)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the first diagonal") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if there is a winner in the second diagonal") {
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns false if not all of the cells are filled and there is no winner") {
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beFalse())
            }
            
            it("returns true if all of the cells are filled and there is a tie") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if all of the cells are filled and there is a winner") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }
            
            it("returns true if all of the cells are filled with one player") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 1, cellStatus: .playerOne)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerOne)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.isGameOver()).to(beTrue())
            }

        }
        
        describe("#currentGameStatus") {
            
            it("returns .playerOneWins if player one has a diagonal win") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .playerOneWins).to(beTrue())
            }
            
            it("returns .playerTwoWins if player two has a vertical win") {
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .playerTwoWins).to(beTrue())
            }
            
            it("returns .Tie if the game has ended in a tie") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerOne)
                board.move(cellIndex: 3, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerTwo)
                board.move(cellIndex: 5, cellStatus: .playerOne)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .tie).to(beTrue())
            }
            
            it("returns .InProgress if the game is still in progress") {
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .inProgress).to(beTrue())
            }
            
        }
        
        describe("#clear") {
            
            it("clears the winner of the game") {
                board.move(cellIndex: 0, cellStatus: .playerOne)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 8, cellStatus: .playerOne)
                rules.updateGameStatus()
                expect(rules.currentGameStatus == .playerOneWins).to(beTrue())
                rules.clear()
                expect(rules.currentGameStatus == .inProgress).to(beTrue())
            }
            
        }
        
    }

}
