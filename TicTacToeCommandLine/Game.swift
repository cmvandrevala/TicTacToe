open class Game: TwoPlayerGame {
    
    public enum PlayerNumber {
        case playerOne
        case playerTwo
    }

    public let gameBoard: Board
    private let clock = Clock()
    private let rules: Rules
    private let boardPrinter: ConsoleBoardPrinter
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

    public var isCurrentPlayerHuman: Bool {
        get {
            switch clock.playerOnesTurn() {
            case true:
                if firstPlayerType is HumanPlayer {
                    return true
                } else {
                    return false
                }
            case false:
                if secondPlayerType is HumanPlayer {
                    return true
                } else {
                    return false
                }
            }
        }
    }

    public init(board: Board) {
        gameBoard = board
        boardPrinter = ConsoleBoardPrinter(board: gameBoard)
        rules = Rules(board: gameBoard)
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

    open func iOSMessage() -> String {
        if isInProgress() {
            switch currentPlayer {
            case .playerOne:
                return messages.itsPlayerOnesTurn(playerOnesMark: marks.playerOnesMark)
            case .playerTwo:
                return messages.itsPlayerTwosTurn(playerTwosMark: marks.playerTwosMark)
            }
        } else {
            return messages.theGameHasEnded
        }
    }

    fileprivate func gameLoop() {
        while isInProgress() {
            switch currentPlayer {
            case .playerOne:
                firstPlayerType.makeMove(game: self)
            case .playerTwo:
                secondPlayerType.makeMove(game: self)
            }
            endTurn()
        }
        gameOverMessage()
    }
    
    fileprivate func gameOverMessage() {
        print(boardPrinter.formattedBoardForConsole())
        print(messages.theGameHasEnded)
    }
    
}
