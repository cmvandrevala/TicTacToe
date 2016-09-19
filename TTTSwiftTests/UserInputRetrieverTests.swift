import Quick
import Nimble
import TTTSwift

class UserInputRetrieverTests: QuickSpec {
    override func spec() {
        
        describe("validation of user inputs") {
            
            var board: Board!
            var manager: UserInputRetriever!
            
            beforeEach {
                board = Board()
                manager = UserInputRetriever(board: board)
            }
            
            it("returns .Passed if the input is valid") {
                expect(manager.checkInput("5") == .Passed).to(beTrue())
            }
            
            it("returns .NonInteger if the input is a float rather than an integer") {
                expect(manager.checkInput("6.8892") == .NonInteger).to(beTrue())
            }
            
            it("returns .NonInteger if the input is a string") {
                expect(manager.checkInput("hello there") == .NonInteger).to(beTrue())
            }
            
            it("returns .TooLarge if the input is greater than eight") {
                expect(manager.checkInput("9") == .TooLarge).to(beTruthy())
            }
            
            it("returns .TooSmall if the input is less than zero") {
                expect(manager.checkInput("-6") == .TooSmall).to(beTrue())
            }
            
            it("returns .Passed if the input is equal to zero (boundary condition)") {
                expect(manager.checkInput("0") == .Passed).to(beTrue())
            }
            
            it("returns .Passed if the input is equal to eight (boundary condition)") {
                expect(manager.checkInput("8") == .Passed).to(beTrue())
            }
            
            it("returns .CellTaken if the user tries to take a cell that is occupied") {
                board.move(1, cellStatus: .PlayerOne)
                expect(manager.checkInput("1") == .CellTaken).to(beTrue())
            }
            
        }
    }
}
