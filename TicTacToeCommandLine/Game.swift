open class Game: TwoPlayerGame {
    
    public enum PlayerNumber {
        case playerOne
        case playerTwo
    }

    private let gameBoard: Board
    private let clock = Clock()
    private let rules: Rules
    private let boardPrinter: ConsoleBoard
    private let messages = TicTacToeMessages()

    public let marks = PlayerMarks()
    public var playCount = 0

    public var currentPlayer: PlayerNumber {
        get {
            switch clock.playerOnesTurn() {
            case true:
                return .playerOne
            case false:
                return .playerTwo
            }
        }
    }

    public var firstPlayerType: Player = FirstAvailableSpotComputerPlayer()
    public var secondPlayerType: Player = FirstAvailableSpotComputerPlayer()
    
    public init(board: Board) {
        gameBoard = board
        rules = Rules(board: gameBoard)
        boardPrinter = ConsoleBoard(board: gameBoard)
    }
    
    open func isInProgress() -> Bool {
        return !rules.isGameOver()
    }
    
    open func clear() {
        gameBoard.clear()
        rules.clear()
        clock.clear()
    }

    open func takeTurn(cellIndex: Int) {
        switch currentPlayer {
        case .playerOne:
            gameBoard.move(cellIndex: cellIndex, cellStatus: .playerOne)
        case .playerTwo:
            gameBoard.move(cellIndex: cellIndex, cellStatus: .playerTwo)
        }
    }

    open func endTurn() {
        clock.incrementTurnNumber()
        rules.updateGameStatus()
    }

    open func play() {
        gameLoop()
        playCount += 1
    }

    fileprivate func gameLoop() {
        var cellIndex: Int
        while isInProgress() {
            printBoardAndBeginningMessagesToConsole()
            switch currentPlayer {
            case .playerOne:
                cellIndex = firstPlayerType.getMove(board: gameBoard)!
            case .playerTwo:
                cellIndex = secondPlayerType.getMove(board: gameBoard)!
            }
            takeTurn(cellIndex: cellIndex)
            printEndingMessagesToConsole(cellIndex: cellIndex)
            endTurn()
        }
        gameOverMessage()
    }
    
    fileprivate func printBoardAndBeginningMessagesToConsole() {
        print(boardPrinter.formattedBoardForConsole())
        switch currentPlayer {
        case .playerOne:
            print(messages.itsPlayerOnesTurn(playerOnesMark: marks.playerOnesMark))
        case .playerTwo:
            print(messages.itsPlayerTwosTurn(playerTwosMark: marks.playerTwosMark))
        }
    }
    
    fileprivate func printEndingMessagesToConsole(cellIndex: Int) {
        switch currentPlayer {
        case .playerOne:
            print(messages.playerOneJustMovedIn(cellIndex: cellIndex))
        case .playerTwo:
            print(messages.playerTwoJustMovedIn(cellIndex: cellIndex))
        }
    }
    
    fileprivate func gameOverMessage() {
        print(boardPrinter.formattedBoardForConsole())
        print(messages.theGameHasEnded)
    }
    
}
