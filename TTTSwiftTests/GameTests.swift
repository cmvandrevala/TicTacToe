import Quick
import Nimble
import TTTSwift

class GameTests: QuickSpec {
    override func spec() {
        
        var ai: FirstAvailableSpotComputerPlayer!
        var game: Game!
        
        beforeEach {
            ai = FirstAvailableSpotComputerPlayer()
            game = Game(playerOne: ai, playerTwo: ai)
        }

        describe("#takeTurn") {
            
            it("lets a 'first available spot' computer player take one turn") {
                game.takeTurn()
                expect(game.board.currentBoard() == [.PlayerOne, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty] ).to(beTrue())
            }
            
            it("lets two 'first available spot' computer players take one turn") {
                game.takeTurn()
                game.takeTurn()
                expect(game.board.currentBoard() == [.PlayerOne, .PlayerTwo, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty] ).to(beTrue())
            }
            
            it("lets two 'first available spot' computer players make many turns") {
                for _ in 1...6 {
                    game.takeTurn()
                }
                expect(game.board.currentBoard() == [.PlayerOne, .PlayerTwo, .PlayerOne, .PlayerTwo, .PlayerOne, .PlayerTwo, .Empty, .Empty, .Empty] ).to(beTrue())
            }
            
        }
        
        describe("#isInProgress") {
            
            it("returns true when a game is initialized") {
                expect(game.isInProgress()).to(equal(true))
            }
            
            it("returns true when there is no winner or tie") {
                game.takeTurn()
                game.takeTurn()
                game.takeTurn()
                expect(game.isInProgress()).to(equal(true))
            }
            
            it("returns false when there is a winner") {
                for _ in 1...7 {
                    game.takeTurn()
                }
                print(game.board.currentBoard())
                expect(game.isInProgress()).to(equal(false))
            }
            
        }

    }
}
