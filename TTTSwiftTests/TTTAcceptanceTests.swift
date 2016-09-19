import Quick
import Nimble
import TTTSwift

class TTTAcceptanceTests: QuickSpec {
    override func spec() {
        
        describe("a full game of tic-tac-toe between two first available space computers plays through and exits properly") {
            
            it("plays the game") {
                let game = Game(playerOne: FirstAvailableSpotComputerPlayer(), playerTwo: FirstAvailableSpotComputerPlayer())
                game.play()
                expect(game.isInProgress()).to(beFalse())
            }
            
        }
        
    }
}
