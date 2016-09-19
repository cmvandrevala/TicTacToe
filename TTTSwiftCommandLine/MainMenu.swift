public class MainMenu {
    
    let playerOne: HumanPlayer!
    let playerTwo: HumanPlayer!
    let messages: ConsoleMessages!
    
    public init() {
        playerOne = HumanPlayer()
        playerTwo = HumanPlayer()
        messages = ConsoleMessages()
    }
    
    public func start() {
        print(messages.welcomeMessage())
        while playerOne.wantsToContinuePlaying {
            let playerResponse = readLine()
            switch playerResponse! {
            case "1":
                Game(playerOne: playerOne, playerTwo: playerTwo).play()
                print(messages.askToPlayAgain())
            case "Yes":
                Game(playerOne: playerOne, playerTwo: playerTwo).play()
                print(messages.askToPlayAgain())
            case "2":
                playerOne.noLongerWantsToPlay()
                print(messages.leaveGameMessage())
            case "No":
                playerOne.noLongerWantsToPlay()
                print(messages.leaveGameMessage())
            default:
                print(messages.invalidInputMessage())
            }
        }
    }
}
