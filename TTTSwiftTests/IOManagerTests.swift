import Quick
import Nimble
import TTTSwift

class IOManagerTests: QuickSpec {
    override func spec() {
        
        describe("#currentTurn") {
            
            var board: Board!
            var manager: IOManager!
            
            beforeEach {
                board = Board()
                manager = IOManager(board: board)
            }
            
            it("starts at turn one") {
                expect(manager.currentTurn()).to(equal(1))
            }
            
            it("increments to the next turn once") {
                manager.incrementTurn()
                expect(manager.currentTurn()).to(equal(2))
            }
            
            it("increments to the next turn many times") {
                for _ in 1...10 {
                    manager.incrementTurn()
                }
                expect(manager.currentTurn()).to(equal(11))
            }
            
        }
        
        describe("#move") {

            var board: Board!
            var manager: IOManager!
            
            beforeEach {
                board = Board()
                manager = IOManager(board: board)
            }
            
            it("moves player one if the turn is odd numbered") {
                manager.move(5)
                expect(board.currentBoard()).to(equal([.Empty, .Empty, .Empty, .Empty, .Empty, .PlayerOne, .Empty, .Empty, .Empty]))
            }
            
            it("moves player two if the turn is even numbered") {
                manager.incrementTurn()
                manager.move(1)
                expect(board.currentBoard()).to(equal([.Empty, .PlayerTwo, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty, .Empty]))
            }
            
        }
    }
}
