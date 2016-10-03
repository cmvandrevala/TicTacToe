open class MainMenu {
    
    let humanPlayer: HumanPlayer!
    let messages: ConsoleMessages!
    let inputReader: ConsoleInputReader!
    
    public init(userInputReader: ConsoleInputReader) {
        humanPlayer = HumanPlayer()
        messages = ConsoleMessages()
        inputReader = userInputReader
    }
    
    open func start(game: TwoPlayerGame) {
        print(messages.welcomeMessage())
        while humanPlayer.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                game.clear()
                game.play(playerOne: humanPlayer, playerTwo: HumanPlayer())
                print(messages.askToPlayAgain())
            case "2":
                game.clear()
                game.play(playerOne: humanPlayer, playerTwo: FirstAvailableSpotComputerPlayer())
                print(messages.askToPlayAgain())
            case "3":
                game.clear()
                game.play(playerOne: FirstAvailableSpotComputerPlayer(), playerTwo: humanPlayer)
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
