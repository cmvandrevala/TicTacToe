import Quick
import Nimble
import TicTacToeCommandLine

class GameFactoryTests: QuickSpec {
    override func spec() {

        describe("creating a new game") {

            it("creates a computer vs. computer game by default") {
                let (game, _) = GameFactory.newGame()
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

            it("returns a blank board") {
                let (_, board) = GameFactory.newGame()
                expect(board.currentBoard() == [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]).to(beTrue())
            }

        }

        describe("updating an existing game") {

            it("updates an existing game to human vs. human") {
                let board = Board()
                let game = Game(board: board)
                GameFactory.updateGame(game: game, type: .humanVsHuman)
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
            }

            it("updates an existing game to human vs. computer") {
                let board = Board()
                let game = Game(board: board)
                GameFactory.updateGame(game: game, type: .humanVsComputer)
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

            it("updates an existing game to computer vs. human") {
                let board = Board()
                let game = Game(board: board)
                GameFactory.updateGame(game: game, type: .computerVsHuman)
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
            }

            it("updates an existing game to computer vs. computer") {
                let board = Board()
                let game = Game(board: board)
                GameFactory.updateGame(game: game, type: .computerVsComputer)
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

        }
        
    }
}
