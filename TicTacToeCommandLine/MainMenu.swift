open class MainMenu {
    
    let humanPlayer: HumanPlayer!
    let messages: TicTacToeMessages!
    let inputReader: InputReader!
    
    public init(userInputReader: InputReader) {
        humanPlayer = HumanPlayer()
        messages = TicTacToeMessages()
        inputReader = userInputReader
    }
    
    open func start(game: TwoPlayerGame) {
        print(messages.welcome)
        print(messages.consoleMenuOptions)
        while humanPlayer.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                game.clear()
                game.play(playerOne: humanPlayer, playerTwo: HumanPlayer())
                print(messages.playAgain)
            case "2":
                game.clear()
                game.play(playerOne: humanPlayer, playerTwo: FirstAvailableSpotComputerPlayer())
                print(messages.playAgain)
            case "3":
                game.clear()
                game.play(playerOne: FirstAvailableSpotComputerPlayer(), playerTwo: humanPlayer)
                print(messages.playAgain)
            case "4":
                humanPlayer.noLongerWantsToPlay()
                print(messages.thankYouForPlaying)
            default:
                print(messages.invalidInputForConsoleMenu)
            }
        }
    }
}
