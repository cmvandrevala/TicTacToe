open class FirstAvailableSpotComputerPlayer: Player {
    
    public init() {}
    
    private let messages = TicTacToeMessages()
    public let marks = PlayerMarks()
    
    open func makeMove(game: Game) {
        printBoardAndBeginningMessagesToConsole(game: game)
        if !game.gameBoard.isFilled() {
            let cellIndex = game.gameBoard.currentBoard().index(of: .empty)
            game.takeTurn(cellIndex: cellIndex!)
            printEndingMessagesToConsole(cellIndex: cellIndex!, currentPlayer: game.currentPlayer)
        }
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
