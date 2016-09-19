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
                expect(game.isInProgress()).to(equal(false))
            }
            
        }
        
    }
}
