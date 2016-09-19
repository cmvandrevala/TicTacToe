import Quick
import Nimble
import TTTSwift

class TTTAcceptanceTests: QuickSpec {
    override func spec() {
        
        describe("acceptance tests") {
            
            it("a full game of tic-tac-toe between two first available space computers plays through and exits properly") {
                let game = Game(playerOne: FirstAvailableSpotComputerPlayer(), playerTwo: FirstAvailableSpotComputerPlayer())
                game.play()
                expect(game.isInProgress()).to(beFalse())
            }
            
        }
        
    }
}
