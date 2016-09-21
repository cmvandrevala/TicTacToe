public class Rules {
    
    public enum GameStatus {
        case PlayerOneWins
        case PlayerTwoWins
        case Tie
        case InProgress
    }
    
    public var currentGameStatus = GameStatus.InProgress

    var gameBoard: Board

    public init(board: Board) {
        gameBoard = board
    }
    
    public func isGameOver() -> Bool {
        switch currentGameStatus {
        case .PlayerOneWins:
            return true
        case .PlayerTwoWins:
            return true
        case .Tie:
            return true
        case .InProgress:
            return false
        }
    }
    
    public func updateGameStatus() {
        updateGameStatusWithPotentialWinner()
        updateGameStatusWithPotentialTie()
    }
    
    public func clear() {
        currentGameStatus = .InProgress
    }
    
    private func updateGameStatusWithPotentialWinner() {
        switch gameBoard.threeInRow() {
        case .PlayerOne:
            currentGameStatus = .PlayerOneWins
        case .PlayerTwo:
            currentGameStatus = .PlayerTwoWins
        default:
            break
        }
    }
    
    private func updateGameStatusWithPotentialTie() {
        if gameBoard.isFilled() && gameBoard.threeInRow() == .Empty {
            currentGameStatus = .Tie
        }
    }

}
