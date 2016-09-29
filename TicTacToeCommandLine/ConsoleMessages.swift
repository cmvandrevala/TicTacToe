open class ConsoleMessages {
    
    public init() {}
    
    open func welcomeMessage() -> String {
        return "\nWelcome to Tic-Tac-Toe! What would you like to do?\n1) Play Human vs. Human\n2) Play Human vs. Computer\n3) Play Computer vs. Human\n4) Exit Tic-TacToe"
    }
    
    open func askToPlayAgain() -> String {
        return "\nWould you like to play again?\n1) Yes, Human vs. Human\n2) Yes, Human vs. Computer\n3) Yes, Computer vs. Human\n4) No Thank You"
    }
    
    open func leaveGameMessage() -> String {
        return "\nThank you for playing!"
    }
    
    open func invalidInputMessage() -> String {
        return "\nSorry, I don't understand your input. Please enter 1, 2, 3, or 4."
    }

}