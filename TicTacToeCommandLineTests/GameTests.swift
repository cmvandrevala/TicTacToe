import Quick
import Nimble
import TicTacToeCommandLine

class GameTests: QuickSpec {
    override func spec() {

        var game: Game!
        
        beforeEach {
            game = Game()
        }
        
        describe("the current set of players") {
            
            it("defaults to two first available spot computer players") {
                let mirrorPlayerOne = Mirror(reflecting: game.playerOne())
                let mirrorPlayerTwo = Mirror(reflecting: game.playerTwo())
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }
            
            it("plays a game through with the two default players") {
                game.play()
                let mirrorPlayerOne = Mirror(reflecting: game.playerOne())
                let mirrorPlayerTwo = Mirror(reflecting: game.playerTwo())
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }
            
            it("plays a game through with two non-default players") {
                game.play(playerOne: RandomSpotComputerPlayer(), playerTwo: RandomSpotComputerPlayer())
                let mirrorPlayerOne = Mirror(reflecting: game.playerOne())
                let mirrorPlayerTwo = Mirror(reflecting: game.playerTwo())
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("RandomSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("RandomSpotComputerPlayer"))
            }

        }
        
        describe("#isInProgress") {
            
            it("returns true when a game is initialized") {
                expect(game.isInProgress()).to(beTrue())
            }
            
            it("returns false when there is a winner") {
                game.play()
                expect(game.isInProgress()).to(beFalse())
            }
            
        }
        
        describe("#clear") {
            
            it("resets the game to start anew") {
                game.play()
                expect(game.isInProgress()).to(beFalse())
                game.clear()
                expect(game.isInProgress()).to(beTrue())
            }

        }

    }
}
