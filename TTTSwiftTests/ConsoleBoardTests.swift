import Quick
import Nimble
import TTTSwift

class ConsoleBoardTests: QuickSpec {
    override func spec() {
        
        var board: Board!
        var printer: ConsoleBoard!
        
        beforeEach {
            board = Board()
            printer = ConsoleBoard(board: board)
        }
        
        describe("#formattedBoardForConsole") {
            
            it("returns a blank board if no moves have been made") {
                let output = "\nThe current board is:\n\n 0 | 1 | 2 \n===========\n 3 | 4 | 5 \n===========\n 6 | 7 | 8 "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a board with one move") {
                board.move(5, cellStatus: .PlayerOne)
                let output = "\nThe current board is:\n\n 0 | 1 | 2 \n===========\n 3 | 4 | X \n===========\n 6 | 7 | 8 "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a board with two moves (first test)") {
                board.move(2, cellStatus: .PlayerOne)
                board.move(7, cellStatus: .PlayerTwo)
                let output = "\nThe current board is:\n\n 0 | 1 | X \n===========\n 3 | 4 | 5 \n===========\n 6 | O | 8 "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a board with three moves") {
                board.move(1, cellStatus: .PlayerTwo)
                board.move(2, cellStatus: .PlayerOne)
                board.move(0, cellStatus: .PlayerTwo)
                let output = "\nThe current board is:\n\n O | O | X \n===========\n 3 | 4 | 5 \n===========\n 6 | 7 | 8 "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
            it("returns a filled board") {
                var i = 0
                repeat {
                    board.move(i, cellStatus: .PlayerOne)
                    i += 1
                } while i < 9
                let output = "\nThe current board is:\n\n X | X | X \n===========\n X | X | X \n===========\n X | X | X "
                expect(printer.formattedBoardForConsole()).to(equal(output))
            }
            
        }
        
    }
}
