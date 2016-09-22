public class Game: TwoPlayerGame {
    
    enum CurrentPlayer {
        case PlayerOne
        case PlayerTwo
    }
    
    let board: Board!
    let clock: Clock!
    let rules: Rules!
    let boardPrinter: ConsoleBoard!
    
    var firstPlayer: Player!
    var secondPlayer: Player!
    
    public init() {
        board = Board()
        clock = Clock()
        rules = Rules(board: board)
        boardPrinter = ConsoleBoard(board: board)
        firstPlayer = FirstAvailableSpotComputerPlayer()
        secondPlayer = FirstAvailableSpotComputerPlayer()
    }
    
    public func play() {
        gameLoop()
    }

    public func play(playerOne: Player, playerTwo: Player) {
        updatePlayers(playerOne, playerTwo: playerTwo)
        gameLoop()
    }
    
    public func isInProgress() -> Bool {
        return !rules.isGameOver()
    }
    
    public func playerOne() -> Player {
        return firstPlayer
    }
    
    public func playerTwo() -> Player {
        return secondPlayer
    }
    
    public func clear() {
        board.clear()
        rules.clear()
        clock.clear()
    }

    private func updatePlayers(playerOne: Player, playerTwo: Player) {
        firstPlayer = playerOne
        secondPlayer = playerTwo
    }
    
    private func gameLoop() {
        while isInProgress() {
            takeTurn()
        }
        gameOverMessage()
    }
    
    private func takeTurn() {
        switch clock.playerOnesTurn() {
        case true:
            printBoardAndBeginningMessagesToConsole(.PlayerOne)
            let cellIndex = firstPlayer.getMove(board)!
            board.move(cellIndex, cellStatus: .PlayerOne)
            printEndingMessagesToConsole(.PlayerOne, cellIndex: cellIndex)
        case false:
            printBoardAndBeginningMessagesToConsole(.PlayerTwo)
            let cellIndex = secondPlayer.getMove(board)!
            board.move(cellIndex, cellStatus: .PlayerTwo)
            printEndingMessagesToConsole(.PlayerTwo, cellIndex: cellIndex)
        }
        endTurn()
    }
    
    private func printBoardAndBeginningMessagesToConsole(currentPlayer: CurrentPlayer) {
        print(boardPrinter.formattedBoardForConsole())
        switch currentPlayer {
        case .PlayerOne:
            print("\nIt is Player One's Turn, Moving as X.")
        case .PlayerTwo:
            print("\nIt is Player Two's Turn, Moving as O.")
        }
    }
    
    private func printEndingMessagesToConsole(currentPlayer: CurrentPlayer, cellIndex: Int) {
        switch currentPlayer {
        case .PlayerOne:
            print("\nPlayer One just moved in cell \(cellIndex).")
        case .PlayerTwo:
            print("\nPlayer Two just moved in cell \(cellIndex).")
        }
    }
    
    private func endTurn() {
        clock.incrementTurnNumber()
        rules.updateGameStatus()
    }
    
    private func gameOverMessage() {
        print(boardPrinter.formattedBoardForConsole())
        print("\nThe game has ended.")
    }
    
}
