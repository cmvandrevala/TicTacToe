import Quick
import Nimble
import TicTacToeiOS

class IOSAcceptanceTests: QuickSpec {
    override func spec() {

        describe("a game of tic-tac-toe on iOS") {

            var mainMenuVC: MainMenuViewController!
            var gameVC: GameViewController!
            var messages: UILabel!

            beforeEach {
                mainMenuVC = MainMenuViewController()
                gameVC = GameViewController()
                messages = UILabel()
                gameVC.messages = messages
            }

            context("human vs. human") {

                var segue: UIStoryboardSegue!

                beforeEach {
                    segue = UIStoryboardSegue(identifier: "HumanVsHuman", source: mainMenuVC, destination: gameVC)
                }

                it("plays a game to completion") {
                    let button0 = UIButton()
                    let button1 = UIButton()
                    let button2 = UIButton()
                    let button3 = UIButton()
                    let button4 = UIButton()
                    button0.tag = 0
                    button1.tag = 1
                    button2.tag = 2
                    button3.tag = 3
                    button4.tag = 4
                    gameVC.cell0 = button0
                    gameVC.cell1 = button1
                    gameVC.cell2 = button2
                    gameVC.cell3 = button3
                    gameVC.cell4 = button4
                    mainMenuVC.prepare(for: segue, sender: UIButton())
                    gameVC.viewDidLoad()

                    gameVC.playerTapsCell(button0)
                    gameVC.playerTapsCell(button3)
                    gameVC.playerTapsCell(button1)
                    gameVC.playerTapsCell(button4)
                    gameVC.playerTapsCell(button2)

                    expect(gameVC.messages.text).to(equal("The game has ended.\n"))
                }
                
            }

            context("human vs. computer") {

                var segue: UIStoryboardSegue!

                beforeEach {
                    segue = UIStoryboardSegue(identifier: "HumanVsComputer", source: mainMenuVC, destination: gameVC)
                }

                it("initializes from the main menu") {
                    let button = UIButton()
                    gameVC.cell5 = button
                    mainMenuVC.prepare(for: segue, sender: UIButton())
                    gameVC.viewDidLoad()

                    gameVC.playerTapsCell(button)

                    expect(gameVC.cell5.titleLabel?.text).to(equal("X"))
                }

                it("plays a game to completion") {
                    let button0 = UIButton()
                    let button2 = UIButton()
                    let button4 = UIButton()
                    let button6 = UIButton()
                    button0.tag = 0
                    button2.tag = 2
                    button4.tag = 4
                    button6.tag = 6
                    gameVC.cell0 = button0
                    gameVC.cell2 = button2
                    gameVC.cell4 = button4
                    gameVC.cell6 = button6
                    mainMenuVC.prepare(for: segue, sender: UIButton())
                    gameVC.viewDidLoad()

                    gameVC.playerTapsCell(button0)
                    gameVC.playerTapsCell(button2)
                    gameVC.playerTapsCell(button4)
                    gameVC.playerTapsCell(button6)

                    expect(gameVC.messages.text).to(equal("The game has ended.\n"))
                }
                
            }

            context("computer vs. human") {

                var segue: UIStoryboardSegue!

                beforeEach {
                    segue = UIStoryboardSegue(identifier: "ComputerVsHuman", source: mainMenuVC, destination: gameVC)
                }

                it("initializes from the main menu") {
                    let button = UIButton()
                    gameVC.cell0 = button
                    mainMenuVC.prepare(for: segue, sender: UIButton())
                    gameVC.viewDidLoad()

                    expect(gameVC.cell0.titleLabel?.text).to(equal("X"))
                }

                it("plays a game to completion") {
                    let button1 = UIButton()
                    let button3 = UIButton()
                    let button5 = UIButton()
                    let button7 = UIButton()
                    button1.tag = 1
                    button3.tag = 3
                    button5.tag = 5
                    button7.tag = 7
                    gameVC.cell1 = button1
                    gameVC.cell3 = button3
                    gameVC.cell5 = button5
                    gameVC.cell7 = button7
                    mainMenuVC.prepare(for: segue, sender: UIButton())
                    gameVC.viewDidLoad()

                    gameVC.playerTapsCell(button1)
                    gameVC.playerTapsCell(button3)
                    gameVC.playerTapsCell(button5)
                    gameVC.playerTapsCell(button7)

                    expect(gameVC.messages.text).to(equal("The game has ended.\n"))
                }

            }

        }
        
    }
}
