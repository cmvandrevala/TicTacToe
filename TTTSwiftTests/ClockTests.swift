import Quick
import Nimble
import TTTSwift

class GameClockTests: QuickSpec {
    override func spec() {
        
        describe("#playerOnesTurn") {
            
            var clock: Clock!
            
            beforeEach {
                clock = Clock()
            }
            
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
        
    }
}
