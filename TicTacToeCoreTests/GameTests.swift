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

        describe("#marks") {

            it("has a mark for player one") {
                expect(game.marks.playerOnesMark).to(equal("X"))
            }

            it("has a mark for player two") {
                expect(game.marks.playerTwosMark).to(equal("O"))
            }

            it("has a blank mark") {
                expect(game.marks.blankMark).to(equal(""))
            }

        }

        describe("#currentPlayer") {

            it("starts off as player one") {
                expect(game.currentPlayer == .playerOne).to(beTrue())
            }
            
        }

        describe("the current types of players") {

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
            
        }
        
        describe("#isInProgress") {
            
            it("returns true when a game is initialized") {
                expect(game.isInProgress()).to(beTrue())
            }

            it("returns false when there is a winner") {
                game.play()
                expect(game.isInProgress()).to(beFalse())
            }

            it("returns true when a game is restarted") {
                game.play()
                game.clear()
                expect(game.isInProgress()).to(beTrue())
            }

            it("returns false when multiple games are played and ended") {
                game.play()
                game.clear()
                game.play()
                expect(game.isInProgress()).to(beFalse())
            }

        }
        
        describe("#clear") {
            
            it("clears the rules, setting isInProgress to true") {
                game.play()
                expect(game.isInProgress()).to(beFalse())
                game.clear()
                expect(game.isInProgress()).to(beTrue())
            }

            it("clears the game board") {
                game.play()
                game.clear()
                expect(board.currentBoard() == [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]).to(beTrue())
            }

            it("resets the clock, setting the current player to .playerOne") {
                game.takeTurn(cellIndex: 5)
                game.clear()
                expect(game.currentPlayer == .playerOne).to(beTrue())
            }

        }

        describe("#takeTurn") {

            it("moves the first player in a cell") {
                game.takeTurn(cellIndex: 3)
                expect(board.currentBoard() == [.empty, .empty, .empty, .playerOne, .empty, .empty, .empty, .empty, .empty]).to(beTrue())
            }

            it("moves the second player in a cell") {
                game.takeTurn(cellIndex: 3)
                game.endTurn()
                game.takeTurn(cellIndex: 8)
                expect(board.currentBoard() == [.empty, .empty, .empty, .playerOne, .empty, .empty, .empty, .empty, .playerTwo]).to(beTrue())
            }

            it("moves multiple players in multiple cells") {
                game.takeTurn(cellIndex: 1)
                game.endTurn()
                game.takeTurn(cellIndex: 3)
                game.endTurn()
                game.takeTurn(cellIndex: 5)
                game.endTurn()
                game.takeTurn(cellIndex: 8)
                expect(board.currentBoard() == [.empty, .playerOne, .empty, .playerTwo, .empty, .playerOne, .empty, .empty, .playerTwo]).to(beTrue())
            }

        }

        describe("#endTurn") {

            it("#sets the current player to playerTwo after one move") {
                game.endTurn()
                expect(game.currentPlayer == .playerTwo).to(beTrue())
            }

            it("#sets the current player to playerOne after two moves") {
                game.endTurn()
                game.endTurn()
                expect(game.currentPlayer == .playerOne).to(beTrue())
            }

            it("#updates the status of the game") {
                game.takeTurn(cellIndex: 0)
                game.takeTurn(cellIndex: 3)
                game.takeTurn(cellIndex: 1)
                game.takeTurn(cellIndex: 4)
                game.takeTurn(cellIndex: 2)

                game.endTurn()

                expect(game.isInProgress()).to(beFalse())
            }

        }

        describe("#playCount and #play") {

            it("starts off with a value of zero") {
                expect(game.playCount).to(equal(0))
            }

            it("increases by one after a game ends") {
                game.play()
                expect(game.playCount).to(equal(1))
            }

            it("increases repeatedly when multiple games end") {
                game.play()
                game.play()
                game.play()
                expect(game.playCount).to(equal(3))
            }
            
        }

        describe("#isCurrentPlayerHuman") {

            it("returns false if the current player (player one) is not a human player") {
                expect(game.isCurrentPlayerHuman).to(beFalse())
            }

            it("returns false if the current player (player two) is not a human player") {
                game.takeTurn(cellIndex: 5)
                expect(game.isCurrentPlayerHuman).to(beFalse())
            }

            it("returns true if the current player (player one) is a human player") {
                game.firstPlayerType = HumanPlayer()
                expect(game.isCurrentPlayerHuman).to(beTrue())
            }

            it("returns true if the current player (player two) is a human player") {
                game.secondPlayerType = HumanPlayer()
                game.endTurn()
                expect(game.isCurrentPlayerHuman).to(beTrue())
            }

            it("returns false if player two is human, but it is player one's turn") {
                game.secondPlayerType = HumanPlayer()
                expect(game.isCurrentPlayerHuman).to(beFalse())
            }

        }

        describe("#iOSMessage") {

            it("returns the end game message if the game has ended") {
                game.play()
                expect(game.iOSMessage()).to(equal("The game has ended.\n"))
            }

            it("returns the player one's turn message if it is player one's turn") {
                expect(game.iOSMessage()).to(equal("It is Player One's turn, moving as X.\n"))
            }

            it("returns the player two's turn message if it is player two's turn") {
                game.endTurn()
                expect(game.iOSMessage()).to(equal("It is Player Two's turn, moving as O.\n"))
            }

        }

    }
}
