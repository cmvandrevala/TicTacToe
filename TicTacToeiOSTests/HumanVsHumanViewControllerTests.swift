import Quick
import Nimble
import TicTacToeiOS

class HumanVsHumanViewControllerTests: QuickSpec {
    override func spec() {

        var controller: HumanVsHumanViewController!

        beforeEach {
            controller = HumanVsHumanViewController()
            controller.viewDidLoad()
        }

        describe("the starting board") {

            var button: UIButton!

            beforeEach {
                button = UIButton()
            }

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
                let button = UIButton()
                button.tag = 0
                controller.cell0 = button
                controller.playerTapsCell(button)

                expect(button.titleLabel?.text).to(equal("X"))
            }

            xit("puts a X in cell five on the first turn") {
                let button = UIButton()
                button.tag = 5
                controller.viewDidLoad()
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
                let button = UIButton()
                button.tag = 0
                controller.cell6 = button
                controller.playerTapsCell(button)
                controller.playerTapsCell(button)

                expect(button.titleLabel?.text).to(equal("X"))
            }

        }

        describe("restarting the game") {

            it("clears the only cell") {
                let button = UIButton()
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

        }

    }
}
