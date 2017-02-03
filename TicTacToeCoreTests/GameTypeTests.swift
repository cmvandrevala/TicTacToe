import Quick
import Nimble
import TicTacToeCommandLine

class GameTypeTests: QuickSpec {
    override func spec() {

        describe("the types of games") {

            var type: GameType!

            beforeEach {
                type = GameType()
            }

            it("defaults to computer vs. computer") {
                expect(type == .computerVsComputer).to(beTrue())
            }

            it("can be human vs human") {
                type = .humanVsHuman
                expect(type == .humanVsHuman).to(beTrue())
            }

            it("can be human vs computer") {
                type = .humanVsComputer
                expect(type == .humanVsComputer).to(beTrue())
            }

            it("can be computer vs human") {
                type = .computerVsHuman
                expect(type == .computerVsHuman).to(beTrue())
            }

            it("can be computer vs computer") {
                type = .humanVsComputer
                type = .computerVsComputer
                expect(type == .computerVsComputer).to(beTrue())
            }

        }
        
    }
}
