import Quick
import Nimble
import TicTacToeCommandLine

class PlayerMarksTests: QuickSpec {
    override func spec() {

        var marks: PlayerMarks!

        beforeEach {
            marks = PlayerMarks()
        }

        describe("player marks") {

            it("player one's mark") {
                expect(marks.playerOnesMark).to(equal("X"))
            }

            it("player two's mark") {
                expect(marks.playerTwosMark).to(equal("O"))
            }

            it("blank mark") {
                expect(marks.blankMark).to(equal(""))
            }
        }

    }
}
