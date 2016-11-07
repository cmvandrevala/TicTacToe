import Quick
import Nimble
import TicTacToeiOS

class GamePresenterTests: QuickSpec {
    override func spec() {

        var presenter: GamePresenter!
        var view: GameViewController!

        beforeEach {
            view = GameViewController()
            presenter = GamePresenter(viewController: view)
        }

        it("returns a message corresponding to the beginning of a game") {
            expect(presenter.currentMessage).to(equal("It is Player One's turn, moving as X.\n"))
        }

    }
}
