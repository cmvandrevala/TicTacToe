import Quick
import Nimble
import TTTSwift

class BoardTests: QuickSpec {
    override func spec() {
        describe("the board") {
            
            it("starts off with no recorded marks") {
                let board = Board()
                let noMarks = ["", "", "", "", "", "", "", "", ""]
                expect(board.currentMarks()).to(equal(noMarks))
            }
            
            it("a cell can be taken by 'player 1'") {
                let board = Board()
                board.move(5, player: .PlayerOne)
                expect(board.currentMarks()).to(equal(["", "", "", "", "", "X", "", "", ""]))
            }
            
            it("a cell can be taken by 'player two'") {
                let board = Board()
                board.move(2, player: .PlayerTwo)
                expect(board.currentMarks()).to(equal(["", "", "O", "", "", "", "", "", ""]))
            }
            
            it("multiple cells can be taken by multiple players") {
                let board = Board()
                board.move(1, player: .PlayerOne)
                board.move(2, player: .PlayerTwo)
                expect(board.currentMarks()).to(equal(["", "X", "O", "", "", "", "", "", ""]))
            }
            
            it("multiple cells can be taken by two players") {
                let board = Board()
                board.move(1, player: .PlayerTwo)
                board.move(2, player: .PlayerOne)
                board.move(0, player: .PlayerTwo)
                expect(board.currentMarks()).to(equal(["O", "O", "X", "", "", "", "", "", ""]))
            }
            
            it("does not allow players to make moves in the same spot twice") {
                let board = Board()
                board.move(7, player: .PlayerOne)
                board.move(7, player: .PlayerTwo)
                expect(board.currentMarks()).to(equal(["", "", "", "", "", "", "", "X", ""]))
            }
            
            it("does not allow a move in an index greater than 8") {
                let board = Board()
                let noMarks = ["", "", "", "", "", "", "", "", ""]
                board.move(14, player: .PlayerOne)
                expect(board.currentMarks()).to(equal(noMarks))
            }
            
            it("does not allow a move in an index less than 0") {
                let board = Board()
                let noMarks = ["", "", "", "", "", "", "", "", ""]
                board.move(-1, player: .PlayerTwo)
                expect(board.currentMarks()).to(equal(noMarks))
            }
            
            it("does allow a move at index 0") {
                let board = Board()
                let marks = ["X", "", "", "", "", "", "", "", ""]
                board.move(0, player: .PlayerOne)
                expect(board.currentMarks()).to(equal(marks))
            }
            
            it("does allow a move at index 8") {
                let board = Board()
                let marks = ["", "", "", "", "", "", "", "", "O"]
                board.move(8, player: .PlayerTwo)
                expect(board.currentMarks()).to(equal(marks))
            }

        }
        
        describe("#forEachMarkByRow") {
            
            it("returns the current marks grouped by row if the function is the identity function") {
                let board = Board()
                board.move(5, player: .PlayerOne)
                let originalMarks = [["", "", ""], ["", "", "X"], ["", "", ""]]
                expect(board.forEachMarkByRow({(s: String) -> (String) in return s})).to(equal(originalMarks))
            }
            
            it("returns the current marks with padding if the function calls for a space on each side of the mark") {
                let board = Board()
                board.move(5, player: .PlayerOne)
                let originalMarks = [["  ", "  ", "  "], ["  ", "  ", " X "], ["  ", "  ", "  "]]
                expect(board.forEachMarkByRow({(s: String) -> (String) in return " \(s) "})).to(equal(originalMarks))
            }
            
            it("correctly handles the edge case of index 0") {
                let board = Board()
                board.move(0, player: .PlayerOne)
                let originalMarks = [[" X ", "  ", "  "], ["  ", "  ", "  "], ["  ", "  ", "  "]]
                expect(board.forEachMarkByRow({(s: String) -> (String) in return " \(s) "})).to(equal(originalMarks))
            }
            
            it("correctly handles the edge case of index 8") {
                let board = Board()
                board.move(8, player: .PlayerOne)
                let originalMarks = [["  ", "  ", "  "], ["  ", "  ", "  "], ["  ", "  ", " X "]]
                expect(board.forEachMarkByRow({(s: String) -> (String) in return " \(s) "})).to(equal(originalMarks))
            }
            
        }
    }
}
