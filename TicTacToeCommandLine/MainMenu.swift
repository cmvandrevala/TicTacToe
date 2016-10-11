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
        var currentGame = game
        print(messages.welcome)
        print(messages.consoleMenuOptions)
        while humanPlayer.wantsToContinuePlaying {
            switch inputReader.getInput()! {
            case "1":
                currentGame.clear()
                currentGame.firstPlayerType = HumanPlayer()
                currentGame.secondPlayerType = HumanPlayer()
                currentGame.play()
                print(messages.playAgain)
            case "2":
                currentGame.clear()
                currentGame.firstPlayerType = HumanPlayer()
                currentGame.secondPlayerType = FirstAvailableSpotComputerPlayer()
                currentGame.play()
                print(messages.playAgain)
            case "3":
                currentGame.clear()
                currentGame.firstPlayerType = FirstAvailableSpotComputerPlayer()
                currentGame.secondPlayerType = HumanPlayer()
                currentGame.play()
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
