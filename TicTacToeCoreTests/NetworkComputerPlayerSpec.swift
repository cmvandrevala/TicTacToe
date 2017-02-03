import Quick
import Nimble
import UIKit
import TicTacToeiOS

class NetworkComputerPlayerTests: QuickSpec {
    override func spec() {
        
        var ai: NetworkComputerPlayer!
        var board: Board!
        var game: Game!
        
        beforeEach {
            ai = NetworkComputerPlayer(view: GameViewController())
            board = Board()
            game = Game(board: board)
        }
        
        describe("network player parameters") {
            
            it("includes the URL of the TTT API") {
                expect(ai.urlString).to(equal("https://dry-wave-85958.herokuapp.com/api/get_move"))
            }
            
            it("uses the correct key for the board query param") {
                expect(ai.boardKey).to(equal("board"))
            }
            
        }
        
        describe("filled board") {
            
            describe("filled board") {
                
                it("does nothing if the board is filled") {
                    for i in 0...8 {
                        game.takeTurn(cellIndex: i)
                        game.endTurn()
                    }
                    ai.makeMove(game: game)
                    expect(board.isFilled()).to(beTruthy())
                }
                
            }
            
        }
    }
}
