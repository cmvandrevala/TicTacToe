import Quick
import Nimble
import TicTacToeiOS

class SegueTests: QuickSpec {
    override func spec() {

        it("correctly sets the game type in a human vs. human game") {
            let mainMenuVC = MainMenuViewController()
            let gameVC = GameViewController()
            let segue = UIStoryboardSegue(identifier: "HumanVsHuman", source: mainMenuVC, destination: gameVC)

            mainMenuVC.prepare(for: segue, sender: UIButton())

            expect(gameVC.gameType == .humanVsHuman).to(beTrue())
        }

        it("correctly sets the game type in a human vs. computer game") {
            let mainMenuVC = MainMenuViewController()
            let gameVC = GameViewController()
            let segue = UIStoryboardSegue(identifier: "HumanVsComputer", source: mainMenuVC, destination: gameVC)

            mainMenuVC.prepare(for: segue, sender: UIButton())

            expect(gameVC.gameType == .humanVsComputer).to(beTrue())
        }

        it("correctly sets the game type in a computer vs. human game") {
            let mainMenuVC = MainMenuViewController()
            let gameVC = GameViewController()
            let segue = UIStoryboardSegue(identifier: "ComputerVsHuman", source: mainMenuVC, destination: gameVC)

            mainMenuVC.prepare(for: segue, sender: UIButton())

            expect(gameVC.gameType == .computerVsHuman).to(beTrue())
        }

    }
}
