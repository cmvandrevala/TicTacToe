public class MainMenu {
    
    let humanPlayer: HumanPlayer!
    let messages: ConsoleMessages!
    let inputReader: ConsoleInputReader!
    
    public init(userInputReader: ConsoleInputReader) {
        humanPlayer = HumanPlayer()
        messages = ConsoleMessages()
        inputReader = userInputReader
    }
    
    public func start(game: TwoPlayerGame) {
        print(messages.welcomeMessage())
        while humanPlayer.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                game.clear()
                game.changePlayerOne(humanPlayer)
                game.changePlayerTwo(HumanPlayer())
                game.play()
                print(messages.askToPlayAgain())
            case "2":
                game.clear()
                game.changePlayerOne(humanPlayer)
                game.changePlayerTwo(FirstAvailableSpotComputerPlayer())
                game.play()
                print(messages.askToPlayAgain())
            case "3":
                game.clear()
                game.changePlayerOne(FirstAvailableSpotComputerPlayer())
                game.changePlayerTwo(humanPlayer)
                game.play()
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
