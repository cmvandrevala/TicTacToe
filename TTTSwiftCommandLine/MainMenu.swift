public class MainMenu {
    
    public let playerOne: HumanPlayer!
    let messages: ConsoleMessages!
    let inputReader: UserInputReader!
    
    public init(userInputReader: UserInputReader) {
        playerOne = HumanPlayer()
        messages = ConsoleMessages()
        inputReader = userInputReader
    }
    
    public func start() {
        print(messages.welcomeMessage())
        while playerOne.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                let playerTwo = HumanPlayer()
                Game(playerOne: playerOne, playerTwo: playerTwo).play()
                print(messages.askToPlayAgain())
            case "2":
                let playerTwo = FirstAvailableSpotComputerPlayer()
                Game(playerOne: playerOne, playerTwo: playerTwo).play()
                print(messages.askToPlayAgain())
            case "3":
                playerOne.noLongerWantsToPlay()
                print(messages.leaveGameMessage())
            default:
                print(messages.invalidInputMessage())
            }
        }
    }
}
