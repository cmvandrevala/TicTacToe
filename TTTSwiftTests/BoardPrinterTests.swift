import Quick
import Nimble
import TTTSwift

class BoardPrinterTests: QuickSpec {
    override func spec() {
        describe("creating a string of the current board") {
            var board: Board!
            var printer: BoardPrinter!
            
            beforeEach {
                board = Board()
                printer = BoardPrinter(board: board)
            }
            
            it("returns a blank board if no moves have been made") {
                let output = "   |   |   \n===========\n   |   |   \n===========\n   |   |   "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a board with one move") {
                board.move(5, cellStatus: .PlayerOne)
                let output = "   |   |   \n===========\n   |   | X \n===========\n   |   |   "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a board with two moves (first test)") {
                board.move(2, cellStatus: .PlayerOne)
                board.move(7, cellStatus: .PlayerTwo)
                let output = "   |   | X \n===========\n   |   |   \n===========\n   | O |   "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a board with three moves") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerOne)
                board.move(0, cellStatus: .PlayerTwo)
                let output = " O | O | X \n===========\n   |   |   \n===========\n   |   |   "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a filled board") {
                var i = 0
                repeat {
                    board.move(i, cellStatus: .PlayerOne)
                    i += 1
                } while i < 9
                let output = " X | X | X \n===========\n X | X | X \n===========\n X | X | X "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
        }
    }
}
