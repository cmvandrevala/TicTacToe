import Quick
import Nimble
import TicTacToeiOS

class HumanVsHumanViewControllerTests: QuickSpec {
    override func spec() {

        var controller: HumanVsHumanViewController!
        var button: UIButton!
        var label: UILabel!

        beforeEach {
            controller = HumanVsHumanViewController()
            button = UIButton()
            label = UILabel()
            controller.messages = label
            controller.viewDidLoad()
        }

        describe("the starting board") {

            it("cell zero starts off blank") {
                button.tag = 0
                controller.cell0 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell one starts off blank") {
                button.tag = 1
                controller.cell1 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell two starts off blank") {
                button.tag = 2
                controller.cell2 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell three starts off blank") {
                button.tag = 3
                controller.cell3 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell four starts off blank") {
                button.tag = 4
                controller.cell4 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell five starts off blank") {
                button.tag = 5
                controller.cell5 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell six starts off blank") {
                button.tag = 6
                controller.cell6 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell seven starts off blank") {
                button.tag = 7
                controller.cell7 = button
                expect(button.titleLabel?.text).to(beNil())
            }

            it("cell eight starts off blank") {
                button.tag = 8
                controller.cell8 = button
                expect(button.titleLabel?.text).to(beNil())
            }

        }

        describe("making a move") {

            it("puts a X in cell zero on the first turn") {
                button.tag = 0
                controller.cell0 = button
                controller.playerTapsCell(button)

                expect(button.titleLabel?.text).to(equal("X"))
            }

            it("puts a X in cell five on the first turn") {
                button.tag = 5
                controller.cell5 = button
                controller.playerTapsCell(button)

                expect(button.titleLabel?.text).to(equal("X"))
            }

            it("puts an O in the second cell taken") {
                let button0 = UIButton()
                let button1 = UIButton()
                button0.tag = 0
                button1.tag = 1
                controller.cell0 = button0
                controller.cell1 = button1
                controller.playerTapsCell(button0)
                controller.playerTapsCell(button1)

                expect(button1.titleLabel?.text).to(equal("O"))
            }

            it("correctly makes three moves") {
                let button0 = UIButton()
                let button1 = UIButton()
                let button2 = UIButton()
                button0.tag = 0
                button1.tag = 1
                button2.tag = 2
                controller.cell0 = button0
                controller.cell1 = button1
                controller.cell2 = button2
                controller.playerTapsCell(button2)
                controller.playerTapsCell(button0)
                controller.playerTapsCell(button1)

                expect(button0.titleLabel?.text).to(equal("O"))
                expect(button1.titleLabel?.text).to(equal("X"))
                expect(button2.titleLabel?.text).to(equal("X"))
            }

            it("does not allow duplicate moves") {
                button.tag = 0
                controller.cell6 = button
                controller.playerTapsCell(button)
                controller.playerTapsCell(button)

                expect(button.titleLabel?.text).to(equal("X"))
            }

        }

        describe("restarting the game") {

            it("clears the only cell") {
                button.tag = 0
                controller.cell0 = button
                controller.playerTapsCell(button)

                controller.newGame()

                expect(button.titleLabel?.text).to(beNil())
            }

            it("clears multiple cells") {
                let button0 = UIButton()
                let button1 = UIButton()
                button0.tag = 0
                button1.tag = 1
                controller.cell0 = button0
                controller.cell1 = button1
                controller.playerTapsCell(button0)
                controller.playerTapsCell(button1)

                controller.newGame()

                expect(button0.titleLabel?.text).to(beNil())
                expect(button1.titleLabel?.text).to(beNil())
            }

            it("displays the correct message after a restart") {
                button.tag = 0
                controller.cell0 = button

                controller.newGame()

                expect(controller.messages.text).to(equal("It is Player One's turn, moving as X.\n"))
            }

            it("displays the correct message after one move and a restart") {
                button.tag = 0
                controller.cell0 = button
                controller.playerTapsCell(button)
                controller.newGame()

                expect(controller.messages.text).to(equal("It is Player One's turn, moving as X.\n"))
            }

        }

        describe("messages") {

            it("starts with a default message of 'It is Player One's turn, moving as X.'") {
                expect(controller.messages.text).to(equal("It is Player One's turn, moving as X.\n"))
            }

            it("displays the correct player after one move") {
                button.tag = 0
                controller.cell0 = button
                controller.playerTapsCell(button)

                expect(controller.messages.text).to(equal("It is Player Two's turn, moving as O.\n"))
            }

            it("displays the correct player after two moves") {
                let button4 = UIButton()
                let button5 = UIButton()
                button4.tag = 4
                button5.tag = 5
                controller.cell4 = button4
                controller.cell5 = button5
                controller.playerTapsCell(button4)
                controller.playerTapsCell(button5)

                expect(controller.messages.text).to(equal("It is Player One's turn, moving as X.\n"))
            }

            it("displays the correct message at the end of the game") {
                let button0 = UIButton()
                let button1 = UIButton()
                let button2 = UIButton()
                let button3 = UIButton()
                let button4 = UIButton()
                let button5 = UIButton()
                let button6 = UIButton()
                button0.tag = 0
                button1.tag = 1
                button2.tag = 2
                button3.tag = 3
                button4.tag = 4
                button5.tag = 5
                button6.tag = 6
                controller.cell0 = button0
                controller.cell1 = button1
                controller.cell2 = button2
                controller.cell3 = button3
                controller.cell4 = button4
                controller.cell5 = button5
                controller.cell6 = button6
                controller.playerTapsCell(button0)
                controller.playerTapsCell(button1)
                controller.playerTapsCell(button2)
                controller.playerTapsCell(button3)
                controller.playerTapsCell(button4)
                controller.playerTapsCell(button5)
                controller.playerTapsCell(button6)

                expect(controller.messages.text).to(equal("The game has ended.\n"))
            }

        }

    }
}
