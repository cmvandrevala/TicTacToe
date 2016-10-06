import Quick
import Nimble
import TicTacToeCommandLine

class TicTacToeMessagesTests: QuickSpec {
    override func spec() {

        var printer: TicTacToeMessages!
        
        beforeEach {
            printer = TicTacToeMessages()
        }
        
        describe("tic-tac-toe messages") {
            
            it("#welcome returns 'Welcome to Tic-Tac-Toe!'") {
                expect(printer.welcome).to(equal("Welcome to Tic-Tac-Toe!\n"))
            }

            it("#consoleMenuOptions returns the menu options") {
                expect(printer.consoleMenuOptions).to(equal("What would you like to do?\n1) Play Human vs. Human\n2) Play Human vs. Computer\n3) Play Computer vs. Human\n4) Exit Tic-TacToe\n"))
            }
            
            it("#playAgain asks the player if he or she would like to play again") {
                expect(printer.playAgain).to(equal("Would you like to play again?\n1) Yes, Human vs. Human\n2) Yes, Human vs. Computer\n3) Yes, Computer vs. Human\n4) No Thank You\n"))
            }
            
            it("#leaveGame thanks the player for playing") {
                expect(printer.thankYouForPlaying).to(equal("Thank you for playing!\n"))
            }

            it("#theGameHasEnded tells the player the game has ended") {
                expect(printer.theGameHasEnded).to(equal("The game has ended.\n"))
            }

            it("#invalidInputForConsoleMenu returns the correct invalid input message") {
                expect(printer.invalidInputForConsoleMenu).to(equal("Sorry, I don't understand your input.\nPlease enter 1, 2, 3, or 4.\n"))
            }

            it("#playerOneJustMovedIn returns where the first player moved") {
                expect(printer.playerOneJustMovedIn(cellIndex: 5)).to(equal("Player One just moved in cell 5.\n"))
            }

            it("#playerTwoJustMovedIn returns where the second player moved") {
                expect(printer.playerTwoJustMovedIn(cellIndex: 2)).to(equal("Player Two just moved in cell 2.\n"))
            }

            it("#itsPlayerOnesTurn returns the current player's turn") {
                expect(printer.itsPlayerOnesTurn).to(equal("It is Player One's turn, moving as X.\n"))
            }

            it("#itsPlayerTwosTurn returns the current player's turn") {
                expect(printer.itsPlayerTwosTurn).to(equal("It is Player Two's turn, moving as O.\n"))
            }

            it("#cellIsTaken alerts the player that a cell has been taken") {
                expect(printer.cellIsTaken).to(equal("That cell has already been taken!\n"))
            }

            it("#selectedCellIndexTooSmall alerts the player that the index for a selected cell is too small") {
                expect(printer.selectedCellIndexTooSmall).to(equal("That cell index is way too small!\n"))
            }

            it("#selectedCellIndexTooLarge alerts the player that the index for a selected cell is too large") {
                expect(printer.selectedCellIndexTooLarge).to(equal("That cell index is way too large!\n"))
            }

            it("#notAnIntegerInput alerts the player that the given input is not an integer") {
                expect(printer.notAnIntegerInput).to(equal("That is not an integer input! Try again!\n"))
            }

            it("#selectCellPrompt asks a player to select a cell") {
                expect(printer.selectCellPrompt).to(equal("Please enter your input [0-8]:\n"))
            }

        }

    }
}
