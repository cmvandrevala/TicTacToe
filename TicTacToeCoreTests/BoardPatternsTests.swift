import Quick
import Nimble
import TicTacToeCommandLine

class BoardPatternsTests: QuickSpec {
    override func spec() {

        describe("groups of three cells") {

            var patterns: BoardPatterns!
            var groups: [[Int]]!

            beforeEach {
                patterns = BoardPatterns()
                groups = patterns.groupsOfThreeCells()
            }

            it("returns the top row of cells") {
                let first =  groups[0][0]
                let middle = groups[0][1]
                let last =   groups[0][2]
                let expected = [0, 1, 2]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the middle row of cells") {
                let first =  groups[1][0]
                let middle = groups[1][1]
                let last =   groups[1][2]
                let expected = [3, 4, 5]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the bottom row of cells") {
                let first =  groups[2][0]
                let middle = groups[2][1]
                let last =   groups[2][2]
                let expected = [6, 7, 8]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the left column of cells") {
                let first =  groups[3][0]
                let middle = groups[3][1]
                let last =   groups[3][2]
                let expected = [0, 3, 6]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the middle column of cells") {
                let first =  groups[4][0]
                let middle = groups[4][1]
                let last =   groups[4][2]
                let expected = [1, 4, 7]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the right column of cells") {
                let first =  groups[5][0]
                let middle = groups[5][1]
                let last =   groups[5][2]
                let expected = [2, 5, 8]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the first diagonal of cells") {
                let first =  groups[6][0]
                let middle = groups[6][1]
                let last =   groups[6][2]
                let expected = [0, 4, 8]
                expect([first, middle, last]).to(equal(expected))
            }

            it("returns the second diagonal of cells") {
                let first =  groups[7][0]
                let middle = groups[7][1]
                let last =   groups[7][2]
                let expected = [2, 4, 6]
                expect([first, middle, last]).to(equal(expected))
            }

        }

    }
}
