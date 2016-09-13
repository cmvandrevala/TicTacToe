import Quick
import Nimble
import TTTSwift

class GameClockTests: QuickSpec {
    override func spec() {
        
        describe("#currentTurnNumber") {

            var clock: GameClock!
            
            beforeEach {
                clock = GameClock()
            }
            
            it("starts at turn one") {
                expect(clock.currentTurnNumber()).to(equal(1))
            }
            
            it("increments to the next turn once") {
                clock.incrementTurnNumber()
                expect(clock.currentTurnNumber()).to(equal(2))
            }
            
            it("increments to the next turn many times") {
                for _ in 1...10 {
                    clock.incrementTurnNumber()
                }
                expect(clock.currentTurnNumber()).to(equal(11))
            }
            
        }
        
        describe("#playerOnesTurn") {
            
            var clock: GameClock!
            
            beforeEach {
                clock = GameClock()
            }
            
            it("returns true if the current turn is odd numbered") {
                expect(clock.playerOnesTurn()).to(beTruthy())
            }
            
            it("returns false if the current turn is even numbered") {
                clock.incrementTurnNumber()
                expect(clock.playerOnesTurn()).to(beFalsy())
            }
            
        }
        
    }
}
