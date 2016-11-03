import Quick
import Nimble
import TicTacToeiOS

class GamePresenterTests: QuickSpec {
    override func spec() {

        var presenter: GamePresenter!

        beforeEach {
            presenter = GamePresenter()
        }

        describe("game type") {

            it("has a default game type of computer vs. computer") {
                expect(presenter.gameType == .computerVsComputer).to(beTrue())
            }

            it("can be updated") {
                presenter.setGameType(gameType: .humanVsHuman)
                expect(presenter.gameType == .humanVsHuman).to(beTrue())
            }

        }

        it("returns a message corresponding to the beginning of a game") {
            expect(presenter.currentMessage).to(equal("It is Player One's turn, moving as X.\n"))
        }

        it("returns a message corresponding to the second move of the game") {
            presenter.playerMoved(move: 1)
            expect(presenter.currentMessage).to(equal("It is Player Two's turn, moving as O.\n"))
        }

        it("returns a message corresponding to the third move of the game") {
            presenter.playerMoved(move: 1)
            presenter.playerMoved(move: 2)
            expect(presenter.currentMessage).to(equal("It is Player One's turn, moving as X.\n"))
        }

    }
}
