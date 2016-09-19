public class Game {
    
    public var board: Board!
    let clock: Clock!
    let rules: Rules!
    
    var firstPlayer: Player!
    var secondPlayer: Player!
    
    public init(playerOne: Player, playerTwo: Player) {
        firstPlayer = playerOne
        secondPlayer = playerTwo
        board = Board()
        clock = Clock()
        rules = Rules(board: board)
    }
    
    public func takeTurn() {
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

}
