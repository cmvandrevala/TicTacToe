import Quick
import Nimble
import TicTacToeCommandLine

class GameClockTests: QuickSpec {
    override func spec() {
        
        var clock: Clock!
        
        beforeEach {
            clock = Clock()
        }
        
        describe("#playerOnesTurn") {
            
            it("returns true if it is the first turn of the game") {
                expect(clock.playerOnesTurn()).to(beTrue())
            }
            
            it("returns true if the current turn is odd numbered") {
                clock.incrementTurnNumber()
                clock.incrementTurnNumber()
                expect(clock.playerOnesTurn()).to(beTrue())
            }
            
            it("returns false if the current turn is even numbered") {
                clock.incrementTurnNumber()
                expect(clock.playerOnesTurn()).to(beFalse())
            }
            
        }
        
        describe("#clear") {
            
            it("resets the clock to the first players turn if it is currently the second player's turn") {
                clock.incrementTurnNumber()
                expect(clock.playerOnesTurn()).to(beFalse())
                clock.clear()
                expect(clock.playerOnesTurn()).to(beTrue())
            }
            
            it("resets the clock to the first player's turn if it is currently the first player's turn") {
                clock.incrementTurnNumber()
                clock.incrementTurnNumber()
                expect(clock.playerOnesTurn()).to(beTrue())
                clock.clear()
                expect(clock.playerOnesTurn()).to(beTrue())
            }

        }
        
    }
}
