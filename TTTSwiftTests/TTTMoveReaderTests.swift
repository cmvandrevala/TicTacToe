import Quick
import Nimble
import TTTSwift

class TTTMoveReaderTests: QuickSpec {
    override func spec() {
        
        describe("validation of user inputs") {
            
            var board: Board!
            var retriever: TTTMoveReader!
            
            beforeEach {
                board = Board()
                retriever = TTTMoveReader(board: board)
            }
            
            it("returns .Passed if the input is valid") {
                expect(retriever.checkInput("5") == .Passed).to(beTrue())
            }
            
            it("returns .NonInteger if the input is a float rather than an integer") {
                expect(retriever.checkInput("6.8892") == .NonInteger).to(beTrue())
            }
            
            it("returns .NonInteger if the input is a string") {
                expect(retriever.checkInput("hello there") == .NonInteger).to(beTrue())
            }
            
            it("returns .TooLarge if the input is greater than eight") {
                expect(retriever.checkInput("9") == .TooLarge).to(beTruthy())
            }
            
            it("returns .TooSmall if the input is less than zero") {
                expect(retriever.checkInput("-6") == .TooSmall).to(beTrue())
            }
            
            it("returns .Passed if the input is equal to zero (boundary condition)") {
                expect(retriever.checkInput("0") == .Passed).to(beTrue())
            }
            
            it("returns .Passed if the input is equal to eight (boundary condition)") {
                expect(retriever.checkInput("8") == .Passed).to(beTrue())
            }
            
            it("returns .CellTaken if the user tries to take a cell that is occupied") {
                board.move(1, cellStatus: .PlayerOne)
                expect(retriever.checkInput("1") == .CellTaken).to(beTrue())
            }
            
        }
    }
}
