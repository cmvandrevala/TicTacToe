import Quick
import Nimble
import TTTSwift

class HumanPlayerTests: QuickSpec {
    override func spec() {
        
        var player: HumanPlayer!
        
        beforeEach {
            player = HumanPlayer()
        }
        
        describe("#wantsToContinuePlaying") {
            
            it("has a default value of true") {
                expect(player.wantsToContinuePlaying).to(beTrue())
            }
            
            it("can be set to false") {
                player.noLongerWantsToPlay()
                expect(player.wantsToContinuePlaying).to(beFalse())
            }
            
        }
        
    }
}
