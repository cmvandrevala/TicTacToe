import Quick
import Nimble
import TicTacToeCommandLine

class NetworkComputerPlayerTests: QuickSpec {
    override func spec() {
        
        var ai: NetworkComputerPlayer!
        var board: Board!
        
        beforeEach {
            ai = NetworkComputerPlayer()
            board = Board()
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
            
            it("returns nil if there are no available spaces") {
                board.move(cellIndex: 0, cellStatus: .playerTwo)
                board.move(cellIndex: 1, cellStatus: .playerTwo)
                board.move(cellIndex: 2, cellStatus: .playerTwo)
                board.move(cellIndex: 3, cellStatus: .playerTwo)
                board.move(cellIndex: 4, cellStatus: .playerOne)
                board.move(cellIndex: 5, cellStatus: .playerTwo)
                board.move(cellIndex: 6, cellStatus: .playerTwo)
                board.move(cellIndex: 7, cellStatus: .playerTwo)
                board.move(cellIndex: 8, cellStatus: .playerTwo)
                expect(ai.getMove(board: board)).to(beNil())
            }
            
        }
        
    }
}
