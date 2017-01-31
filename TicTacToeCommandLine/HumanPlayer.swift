open class HumanPlayer: Player {
    
    open var wantsToContinuePlaying: Bool = true
    private let messages = TicTacToeMessages()
    public let marks = PlayerMarks()
    
    public init() {}
    
    open func noLongerWantsToPlay() {
        wantsToContinuePlaying = !wantsToContinuePlaying
    }
    
    open func makeMove(game: Game) {
        printBoardAndBeginningMessagesToConsole(game: game)
        let inputReader = TTTMoveReader(board: game.gameBoard)
        let cellIndex = Int(inputReader.getInput()!)
        game.takeTurn(cellIndex: cellIndex!)
        printEndingMessagesToConsole(cellIndex: cellIndex!, currentPlayer: game.currentPlayer)
    }
    
    fileprivate func printBoardAndBeginningMessagesToConsole(game: Game) {
        let boardPrinter = ConsoleBoard(board: game.gameBoard)
        print(boardPrinter.formattedBoardForConsole())
        switch game.currentPlayer {
        case .playerOne:
            print(messages.itsPlayerOnesTurn(playerOnesMark: marks.playerOnesMark))
        case .playerTwo:
            print(messages.itsPlayerTwosTurn(playerTwosMark: marks.playerTwosMark))
        }
    }
    
    fileprivate func printEndingMessagesToConsole(cellIndex: Int, currentPlayer: Game.PlayerNumber) {
        switch currentPlayer {
        case .playerOne:
            print(messages.playerOneJustMovedIn(cellIndex: cellIndex))
        case .playerTwo:
            print(messages.playerTwoJustMovedIn(cellIndex: cellIndex))
        }
    }
    
    
}
