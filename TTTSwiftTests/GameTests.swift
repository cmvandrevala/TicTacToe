import Quick
import Nimble
import TTTSwift

class GameTests: QuickSpec {
    override func spec() {

        var game: Game!
        
        beforeEach {
            game = Game()
        }
        
        describe("#isInProgress") {
            
            it("returns true when a game is initialized") {
                expect(game.isInProgress()).to(beTrue())
            }
            
            it("returns true when there is no winner or tie") {
                game.takeTurn()
                game.takeTurn()
                game.takeTurn()
                expect(game.isInProgress()).to(beTrue())
            }
            
            it("returns false when there is a winner") {
                for _ in 1...7 {
                    game.takeTurn()
                }
                expect(game.isInProgress()).to(beFalse())
            }
            
        }
        
        describe("#clear") {
            
            it("resets the game to start anew") {
                for _ in 1...7 {
                    game.takeTurn()
                }
                expect(game.isInProgress()).to(beFalse())
                game.clear()
                expect(game.isInProgress()).to(beTrue())
            }

        }
        
    }
}
