import Quick
import Nimble
import TicTacToeCommandLine

class TTTAcceptanceTests: QuickSpec {
    override func spec() {
        
        describe("acceptance tests") {
            
            it("a full game of tic-tac-toe between two first available space computers plays through and exits properly") {
                let game = Game()
                game.play(FirstAvailableSpotComputerPlayer(), playerTwo: FirstAvailableSpotComputerPlayer())
                expect(game.isInProgress()).to(beFalse())
            }
            
        }
        
    }
}
