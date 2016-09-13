import Quick
import Nimble
import TTTSwift

class UserInputRetrieverTests: QuickSpec {
    override func spec() {
        
        describe("#move") {

            var board: Board!
            var clock: GameClock!
            var manager: UserInputRetriever!
            
            beforeEach {
                board = Board()
                clock = GameClock()
                manager = UserInputRetriever(board: board)
            }
            
            it("moves player one if the turn is odd numbered") {
                manager.move(5, clock: clock)
                expect(board.currentBoard()).to(equal([.Empty, .Empty, .Empty, .Empty, .Empty, .PlayerOne, .Empty, .Empty, .Empty]))
            }
            
            it("moves player two if the turn is even numbered") {
                clock.incrementTurnNumber()
                manager.move(1, clock: clock)
                expect(board.currentBoard()).to(equal([.Empty, .PlayerTwo, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty]))
            }
            
        }
        
        describe("validation of user inputs") {
            
            var board: Board!
            var manager: UserInputRetriever!
            
            beforeEach {
                board = Board()
                manager = UserInputRetriever(board: board)
            }
            
            it("returns .Passed if the input is valid") {
                expect(manager.checkInput("5") == .Passed).to(beTruthy())
            }
            
            it("returns .NonInteger if the input is a float rather than an integer") {
                expect(manager.checkInput("6.8892") == .NonInteger).to(beTruthy())
            }
            
            it("returns .NonInteger if the input is a string") {
                expect(manager.checkInput("hello there") == .NonInteger).to(beTruthy())
            }
            
            it("returns .TooLarge if the input is greater than eight") {
                expect(manager.checkInput("9") == .TooLarge).to(beTruthy())
            }
            
            it("returns .TooSmall if the input is less than zero") {
                expect(manager.checkInput("-6") == .TooSmall).to(beTruthy())
            }
            
            it("returns .Passed if the input is equal to zero (boundary condition)") {
                expect(manager.checkInput("0") == .Passed).to(beTruthy())
            }
            
            it("returns .Passed if the input is equal to eight (boundary condition)") {
                expect(manager.checkInput("8") == .Passed).to(beTruthy())
            }
            
            it("returns .CellTaken if the user tries to take a cell that is occupied") {
                board.move(1, cellStatus: .PlayerOne)
                expect(manager.checkInput("1") == .CellTaken).to(beTruthy())
            }
            
        }
    }
}
