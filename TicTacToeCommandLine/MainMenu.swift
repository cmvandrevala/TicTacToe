open class MainMenu {
    
    let humanPlayer: HumanPlayer!
    let messages: ConsoleMessages!
    let inputReader: ConsoleInputReader!
    
    public init(userInputReader: ConsoleInputReader) {
        humanPlayer = HumanPlayer()
        messages = ConsoleMessages()
        inputReader = userInputReader
    }
    
    open func start(_ game: TwoPlayerGame) {
        print(messages.welcomeMessage())
        while humanPlayer.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                game.clear()
                game.play(humanPlayer, playerTwo: HumanPlayer())
                print(messages.askToPlayAgain())
            case "2":
                game.clear()
                game.play(humanPlayer, playerTwo: FirstAvailableSpotComputerPlayer())
                print(messages.askToPlayAgain())
            case "3":
                game.clear()
                game.play(FirstAvailableSpotComputerPlayer(), playerTwo: humanPlayer)
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
