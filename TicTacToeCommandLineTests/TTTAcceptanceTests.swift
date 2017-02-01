import Quick
import Nimble
import TicTacToeCommandLine

class TTTAcceptanceTests: QuickSpec {
    override func spec() {
        
        describe("playing a full game between two first available space computers") {
            
            it("starts off in progress") {
                let game = Game(board: Board())
                expect(game.isInProgress()).to(beTrue())
            }

            it("plays through and exits properly") {
                let game = Game(board: Board())
                game.play()
                expect(game.isInProgress()).to(beFalse())
            }

            it("marks the first seven cells of the board") {
                let board = Board()
                let game = Game(board: board)
                game.play()
                expect(board.currentBoard() == [.playerOne, .playerTwo, .playerOne, .playerTwo, .playerOne, .playerTwo, .playerOne, .empty, .empty]).to(beTrue())
            }

        }
        
    }
}
