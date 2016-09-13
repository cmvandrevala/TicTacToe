public class ConsoleMessages {
    
    public init() {}
    
    public func welcomeMessage() -> String {
        return "\nWelcome to Tic-Tac-Toe! Would You Like to Start a New Game?\n1) Yes\n2) No"
    }
    
    public func askToPlayAgain() -> String {
        return "\nWould you like to play again?\n1) Yes\n2) No"
    }
    
    public func leaveGameMessage() -> String {
        return "\nThank you for playing!"
    }
    
    public func invalidInputMessage() -> String {
        return "\nSorry, I don't understand your input. Enter 1 or 2."
    }

}