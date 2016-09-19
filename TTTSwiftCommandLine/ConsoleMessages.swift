public class ConsoleMessages {
    
    public init() {}
    
    public func welcomeMessage() -> String {
        return "\nWelcome to Tic-Tac-Toe! What would you like to do?\n1) Play Human vs. Human\n2) Play Human vs. Computer\n3) Exit Tic-TacToe"
    }
    
    public func askToPlayAgain() -> String {
        return "\nWould you like to play again?\n1) Yes, Human vs. Human\n2) Yes, Human vs. Computer\n3) No Thank You"
    }
    
    public func leaveGameMessage() -> String {
        return "\nThank you for playing!"
    }
    
    public func invalidInputMessage() -> String {
        return "\nSorry, I don't understand your input. Please enter 1, 2, or 3."
    }

}
