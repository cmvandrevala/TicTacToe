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
            
            it("#welcomeMessage returns 'Welcome to Tic-Tac-Toe! Would You Like to Start a New Game?'") {
                expect(printer.welcomeMessage()).to(equal("\nWelcome to Tic-Tac-Toe! Would You Like to Start a New Game?\n1) Yes\n2) No"))
            }
            
            it("#askToPlayAgain returns 'Would you like to play again?'") {
                expect(printer.askToPlayAgain()).to(equal("\nWould you like to play again?\n1) Yes\n2) No"))
            }
            
            it("#leaveGameMessage returns 'Thank you for playing!'") {
                expect(printer.leaveGameMessage()).to(equal("\nThank you for playing!"))
            }
            
            it("#invalidInputMessage returns 'Sorry, I don't understand your input. Enter 1 or 2.'") {
                expect(printer.invalidInputMessage()).to(equal("\nSorry, I don't understand your input. Enter 1 or 2."))
            }

        }

    }
}
