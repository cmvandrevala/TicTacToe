public class Rules {
    
    enum GameStatus {
        case Winner
        case Tie
        case InProgress
    }
    
    var gameBoard: Board
    var currentGameStatus: GameStatus
    
    public init(board: Board) {
        gameBoard = board
        currentGameStatus = .InProgress
    }
    
    public func gameIsOver() -> Bool {
        switch currentGameStatus {
        case .Winner:
            return true
        case .Tie:
            return true
        case .InProgress:
            return false
        }
    }
    
    public func updateGameStatus() {
        checkIfGameEndedInWin()
        checkIfGameEndedInTie()
    }
    
    private func checkIfGameEndedInWin() {
        if gameBoard.threeInRow() {
            currentGameStatus = .Winner
        }
    }
    
    private func checkIfGameEndedInTie() {
        if gameBoard.filledBoard() && !gameBoard.threeInRow() {
            currentGameStatus = .Tie
        }
    }

}