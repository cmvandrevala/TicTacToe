public class Game {
    
    let board: Board!
    let clock: Clock!
    let rules: Rules!
    let boardPrinter: ConsoleBoard!
    
    var firstPlayer: Player!
    var secondPlayer: Player!
    
    public init(playerOne: Player, playerTwo: Player) {
        firstPlayer = playerOne
        secondPlayer = playerTwo
        board = Board()
        clock = Clock()
        rules = Rules(board: board)
        boardPrinter = ConsoleBoard(board: board)
    }
    
    public func play() {
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
    
    private func printBoardAndMessagesToConsole() {
        print(boardPrinter.formattedBoardForConsole())
    }
    
}
