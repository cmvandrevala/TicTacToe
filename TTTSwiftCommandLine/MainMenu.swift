public class MainMenu {
    
    public let humanPlayer: HumanPlayer!
    let messages: ConsoleMessages!
    let inputReader: ConsoleInputReader!
    
    public init(userInputReader: ConsoleInputReader) {
        humanPlayer = HumanPlayer()
        messages = ConsoleMessages()
        inputReader = userInputReader
    }
    
    public func start() {
        print(messages.welcomeMessage())
        while humanPlayer.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                let anotherHumanPlayer = HumanPlayer()
                Game(playerOne: humanPlayer, playerTwo: anotherHumanPlayer).play()
                print(messages.askToPlayAgain())
            case "2":
                let computerPlayer = FirstAvailableSpotComputerPlayer()
                Game(playerOne: humanPlayer, playerTwo: computerPlayer).play()
                print(messages.askToPlayAgain())
            case "3":
                let computerPlayer = FirstAvailableSpotComputerPlayer()
                Game(playerOne: computerPlayer, playerTwo: humanPlayer).play()
                print(messages.askToPlayAgain())
            case "4":
                humanPlayer.noLongerWantsToPlay()
                print(messages.leaveGameMessage())
            default:
                print(messages.invalidInputMessage())
            }
        }
    }
}
