open class Rules {
    
    public enum GameStatus {
        case playerOneWins
        case playerTwoWins
        case tie
        case inProgress
    }
    
    open var currentGameStatus = GameStatus.inProgress

    var gameBoard: Board

    public init(board: Board) {
        gameBoard = board
    }
    
    open func isGameOver() -> Bool {
        switch currentGameStatus {
        case .playerOneWins:
            return true
        case .playerTwoWins:
            return true
        case .tie:
            return true
        case .inProgress:
            return false
        }
    }
    
    open func updateGameStatus() {
        updateGameStatusWithPotentialWinner()
        updateGameStatusWithPotentialTie()
    }
    
    open func clear() {
        currentGameStatus = .inProgress
    }
    
    fileprivate func updateGameStatusWithPotentialWinner() {
        switch gameBoard.threeInRow() {
        case .playerOne:
            currentGameStatus = .playerOneWins
        case .playerTwo:
            currentGameStatus = .playerTwoWins
        default:
            break
        }
    }
    
    fileprivate func updateGameStatusWithPotentialTie() {
        if gameBoard.isFilled() && gameBoard.threeInRow() == .empty {
            currentGameStatus = .tie
        }
    }

}
