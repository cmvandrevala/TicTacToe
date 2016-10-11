import Quick
import Nimble
import TicTacToeCommandLine

class GameTests: QuickSpec {
    override func spec() {

        var board: Board!
        var game: Game!
        
        beforeEach {
            board = Board()
            game = Game(board: board)
        }
        
        describe("the current set of players") {
            
            it("defaults to two first available spot computer players") {
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

            it("plays a game through with the two default players") {
                game.play()
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

            it("plays a game through with two non-default players") {
                game.firstPlayerType = RandomSpotComputerPlayer()
                game.secondPlayerType = RandomSpotComputerPlayer()
                game.play()
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
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

        describe("#gameCount") {

            it("starts off with a value of zero") {
                expect(game.playCount).to(equal(0))
            }

            it("increases by one after a game ends") {
                game.play()
                expect(game.playCount).to(equal(1))
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

        describe("#currentPlayer") {

            it("starts off as player one") {
                expect(game.currentPlayer == .playerOne).to(beTrue())
            }

            it("#becomes player two after one move") {
                game.takeTurn(cellIndex: 5)
                expect(game.currentPlayer == .playerTwo).to(beTrue())
            }

            it("#becomes player one after two moves") {
                game.takeTurn(cellIndex: 5)
                game.takeTurn(cellIndex: 1)
                expect(game.currentPlayer == .playerOne).to(beTrue())
            }

        }

    }
}
