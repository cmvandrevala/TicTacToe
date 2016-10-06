public struct TicTacToeMessages {
    
    public init() {}

    
    public var welcome = "Welcome to Tic-Tac-Toe!\n"
    public var thankYouForPlaying = "Thank you for playing!\n"
    public var theGameHasEnded = "The game has ended.\n"
    public var cellIsTaken = "That cell has already been taken!\n"
    public var selectedCellIndexTooSmall = "That cell index is way too small!\n"
    public var selectedCellIndexTooLarge = "That cell index is way too large!\n"
    public var notAnIntegerInput = "That is not an integer input! Try again!\n"
    public var selectCellPrompt = "Please enter your input [0-8]:\n"


    public var consoleMenuOptions = "What would you like to do?\n" +
                                    "1) Play Human vs. Human\n" +
                                    "2) Play Human vs. Computer\n" +
                                    "3) Play Computer vs. Human\n" +
                                    "4) Exit Tic-TacToe\n"

    public var playAgain = "Would you like to play again?\n" +
                           "1) Yes, Human vs. Human\n" +
                           "2) Yes, Human vs. Computer\n" +
                           "3) Yes, Computer vs. Human\n" +
                           "4) No Thank You\n"

    public var invalidInputForConsoleMenu = "Sorry, I don't understand your input.\n" +
                                            "Please enter 1, 2, 3, or 4.\n"


    public func playerOneJustMovedIn(cellIndex: Int) -> String {
        return "Player One just moved in cell \(cellIndex).\n"
    }

    public func playerTwoJustMovedIn(cellIndex: Int) -> String {
        return "Player Two just moved in cell \(cellIndex).\n"
    }

    public func itsPlayerOnesTurn(playerOnesMark: String) -> String {
        return "It is Player One's turn, moving as \(playerOnesMark).\n"
    }

    public func itsPlayerTwosTurn(playerTwosMark: String) -> String {
        return "It is Player Two's turn, moving as \(playerTwosMark).\n"
    }

}
