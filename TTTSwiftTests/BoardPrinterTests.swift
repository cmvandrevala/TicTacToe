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
                printer = BoardPrinter()
            }
            
            it("returns a blank board if no moves have been made") {
                let output = "   |   |   \n===========\n   |   |   \n===========\n   |   |   "
                expect(printer.formattedBoardForConsole(board)).to(equal(output))
            }
            
            it("returns a board with one move") {
                board.move(5, player: "X")
                let output = "   |   |   \n===========\n   |   | X \n===========\n   |   |   "
                expect(printer.formattedBoardForConsole(board)).to(equal(output))
            }
            
            it("returns a board with two moves (first test)") {
                board.move(2, player: "X")
                board.move(7, player: "O")
                let output = "   |   | X \n===========\n   |   |   \n===========\n   | O |   "
                expect(printer.formattedBoardForConsole(board)).to(equal(output))
            }
            
            it("returns a board with three moves") {
                board.move(1, player: "O")
                board.move(2, player: "X")
                board.move(0, player: "O")
                print(board.currentMarks())
                let output = " O | O | X \n===========\n   |   |   \n===========\n   |   |   "
                expect(printer.formattedBoardForConsole(board)).to(equal(output))
            }
            
            it("returns a filled board") {
                var i = 0
                repeat {
                    board.move(i, player: "Z")
                    i += 1
                } while i < 9
                let output = " Z | Z | Z \n===========\n Z | Z | Z \n===========\n Z | Z | Z "
                expect(printer.formattedBoardForConsole(board)).to(equal(output))
            }
            
        }
    }
}
