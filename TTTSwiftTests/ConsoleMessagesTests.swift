import Quick
import Nimble
import TTTSwift

class ConsoleMessagesTests: QuickSpec {
    override func spec() {

        var printer: ConsoleMessages!
        
        beforeEach {
            printer = ConsoleMessages()
        }
        
        describe("tic-tac-toe console messages") {
            
            it("#welcomeMessage returns 'Welcome to Tic-Tac-Toe! What would you like to do?'") {
                expect(printer.welcomeMessage()).to(equal("\nWelcome to Tic-Tac-Toe! What would you like to do?\n1) Play Human vs. Human\n2) Play Human vs. Computer\n3) Exit Tic-TacToe"))
            }
            
            it("#askToPlayAgain returns 'Would you like to play again?'") {
                expect(printer.askToPlayAgain()).to(equal("\nWould you like to play again?\n1) Yes, Human vs. Human\n2) Yes, Human vs. Computer\n3) No Thank You"))
            }
            
            it("#leaveGameMessage returns 'Thank you for playing!'") {
                expect(printer.leaveGameMessage()).to(equal("\nThank you for playing!"))
            }
            
            it("#invalidInputMessage returns 'Sorry, I don't understand your input. Please enter 1, 2, or 3.'") {
                expect(printer.invalidInputMessage()).to(equal("\nSorry, I don't understand your input. Please enter 1, 2, or 3."))
            }

        }

    }
}
