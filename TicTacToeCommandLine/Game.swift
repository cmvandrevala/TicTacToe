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
    public var currentPlayer: PlayerNumber = .playerOne
    public var playCount = 0

    public var firstPlayerType: Player = FirstAvailableSpotComputerPlayer()
    public var secondPlayerType: Player = FirstAvailableSpotComputerPlayer()
    
    public init(board: Board) {
        gameBoard = board
        rules = Rules(board: gameBoard)
        boardPrinter = ConsoleBoard(board: gameBoard)
    }
    
    open func play() {
        gameLoop()
        playCount += 1
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
        switch clock.playerOnesTurn() {
        case true:
            gameBoard.move(cellIndex: cellIndex, cellStatus: .playerOne)
            printEndingMessagesToConsole(currentPlayer: .playerOne, cellIndex: cellIndex)
        case false:
            gameBoard.move(cellIndex: cellIndex, cellStatus: .playerTwo)
            printEndingMessagesToConsole(currentPlayer: .playerTwo, cellIndex: cellIndex)
        }
        endTurn()
    }
    
    fileprivate func gameLoop() {
        var cellIndex = 0
        while isInProgress() {
            switch clock.playerOnesTurn() {
            case true:
                printBoardAndBeginningMessagesToConsole(currentPlayer: .playerOne)
                cellIndex = firstPlayerType.getMove(board: gameBoard)!
            case false:
                printBoardAndBeginningMessagesToConsole(currentPlayer: .playerTwo)
                cellIndex = secondPlayerType.getMove(board: gameBoard)!
            }
            takeTurn(cellIndex: cellIndex)
        }
        gameOverMessage()
    }
    
    fileprivate func printBoardAndBeginningMessagesToConsole(currentPlayer: PlayerNumber) {
        print(boardPrinter.formattedBoardForConsole())
        switch currentPlayer {
        case .playerOne:
            print(messages.itsPlayerOnesTurn(playerOnesMark: marks.playerOnesMark))
        case .playerTwo:
            print(messages.itsPlayerTwosTurn(playerTwosMark: marks.playerTwosMark))
        }
    }
    
    fileprivate func printEndingMessagesToConsole(currentPlayer: PlayerNumber, cellIndex: Int) {
        switch currentPlayer {
        case .playerOne:
            print(messages.playerOneJustMovedIn(cellIndex: cellIndex))
        case .playerTwo:
            print(messages.playerTwoJustMovedIn(cellIndex: cellIndex))
        }
    }
    
    fileprivate func endTurn() {
        clock.incrementTurnNumber()
        rules.updateGameStatus()
        if currentPlayer == .playerOne {
            currentPlayer = .playerTwo
        } else {
            currentPlayer = .playerOne
        }
    }
    
    fileprivate func gameOverMessage() {
        print(boardPrinter.formattedBoardForConsole())
        print(messages.theGameHasEnded)
    }
    
}
