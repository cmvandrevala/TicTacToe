public class Game: TwoPlayerGame {
    
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
    
    public func play(playerOne: Player, playerTwo: Player) {
        firstPlayer = playerOne
        secondPlayer = playerTwo
        while isInProgress() {
            takeTurn()
        }
        printBoardAndMessagesToConsole()
    }
    
    public func takeTurn() {
        printBoardAndMessagesToConsole()
        switch clock.playerOnesTurn() {
        case true:
            board.move(firstPlayer.getMove(board)!, cellStatus: .PlayerOne)
        case false:
            board.move(secondPlayer.getMove(board)!, cellStatus: .PlayerTwo)
        }
        clock.incrementTurnNumber()
        rules.updateGameStatus()
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
    
    private func printBoardAndMessagesToConsole() {
        print(boardPrinter.formattedBoardForConsole())
    }
    
}
