import Quick
import Nimble
import TicTacToeCommandLine

class GameFactoryTests: QuickSpec {
    override func spec() {

        describe("creating a new game") {

            it("creates a human vs. human game") {
                let (game, _) = GameFactory.newGame(type: .humanVsHuman)
                let mirrorPlayerOne = Mirror(reflecting: game!.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game!.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
            }

            it("creates a human vs. computer game") {
                let (game, _) = GameFactory.newGame(type: .humanVsComputer)
                let mirrorPlayerOne = Mirror(reflecting: game!.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game!.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

            it("creates a computer vs. human game") {
                let (game, _) = GameFactory.newGame(type: .computerVsHuman)
                let mirrorPlayerOne = Mirror(reflecting: game!.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game!.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
            }

            it("creates a computer vs. computer game") {
                let (game, _) = GameFactory.newGame(type: .computerVsComputer)
                let mirrorPlayerOne = Mirror(reflecting: game!.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game!.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("FirstAvailableSpotComputerPlayer"))
            }

            it("handles an unassigned game by creating two human players") {
                let (game, _) = GameFactory.newGame(type: .unassigned)
                let mirrorPlayerOne = Mirror(reflecting: game!.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game!.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
            }

            it("returns a blank board") {
                let (_, board) = GameFactory.newGame(type: .humanVsHuman)
                expect(board!.currentBoard() == [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]).to(beTrue())
            }

            it("creates a default unassigned game if no argument is passed in") {
                let (game, _) = GameFactory.newGame()
                let mirrorPlayerOne = Mirror(reflecting: game!.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game!.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
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

            it("updates an existing game to unassigned (two human players)") {
                let board = Board()
                let game = Game(board: board)
                GameFactory.updateGame(game: game, type: .unassigned)
                let mirrorPlayerOne = Mirror(reflecting: game.firstPlayerType)
                let mirrorPlayerTwo = Mirror(reflecting: game.secondPlayerType)
                expect(String(describing: mirrorPlayerOne.subjectType)).to(equal("HumanPlayer"))
                expect(String(describing: mirrorPlayerTwo.subjectType)).to(equal("HumanPlayer"))
            }

        }
        
    }
}
