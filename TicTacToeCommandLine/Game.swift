open class Game: TwoPlayerGame {
    
    enum CurrentPlayer {
        case playerOne
        case playerTwo
    }
    
    let gameBoard: Board!
    let clock: Clock!
    let rules: Rules!
    let marks: PlayerMarks!
    let boardPrinter: ConsoleBoard!
    
    var firstPlayer: Player!
    var secondPlayer: Player!

    var messages: TicTacToeMessages!
    
    public init(board: Board) {
        gameBoard = board
        clock = Clock()
        rules = Rules(board: gameBoard)
        marks = PlayerMarks()
        boardPrinter = ConsoleBoard(board: gameBoard)
        firstPlayer = FirstAvailableSpotComputerPlayer()
        secondPlayer = FirstAvailableSpotComputerPlayer()
        messages = TicTacToeMessages()
    }
    
    open func play() {
        gameLoop()
    }

    open func play(playerOne: Player, playerTwo: Player) {
        updatePlayers(playerOne: playerOne, playerTwo: playerTwo)
        gameLoop()
    }
    
    open func isInProgress() -> Bool {
        return !rules.isGameOver()
    }
    
    open func playerOne() -> Player {
        return firstPlayer
    }
    
    open func playerTwo() -> Player {
        return secondPlayer
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

    fileprivate func updatePlayers(playerOne: Player, playerTwo: Player) {
        firstPlayer = playerOne
        secondPlayer = playerTwo
    }
    
    fileprivate func gameLoop() {
        var cellIndex = 0
        while isInProgress() {
            switch clock.playerOnesTurn() {
            case true:
                printBoardAndBeginningMessagesToConsole(currentPlayer: .playerOne)
                cellIndex = firstPlayer.getMove(board: gameBoard)!
            case false:
                printBoardAndBeginningMessagesToConsole(currentPlayer: .playerTwo)
                cellIndex = secondPlayer.getMove(board: gameBoard)!
            }
            takeTurn(cellIndex: cellIndex)
        }
        gameOverMessage()
    }
    
    fileprivate func printBoardAndBeginningMessagesToConsole(currentPlayer: CurrentPlayer) {
        print(boardPrinter.formattedBoardForConsole())
        switch currentPlayer {
        case .playerOne:
            print(messages.itsPlayerOnesTurn(playerOnesMark: marks.playerOnesMark))
        case .playerTwo:
            print(messages.itsPlayerTwosTurn(playerTwosMark: marks.playerTwosMark))
        }
    }
    
    fileprivate func printEndingMessagesToConsole(currentPlayer: CurrentPlayer, cellIndex: Int) {
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
    }
    
    fileprivate func gameOverMessage() {
        print(boardPrinter.formattedBoardForConsole())
        print(messages.theGameHasEnded)
    }
    
}
