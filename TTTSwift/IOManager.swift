public class IOManager {
    
    var turn = 1
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    public func currentTurn() -> Int {
        return turn
    }
    
    public func incrementTurn() {
        turn += 1
    }
    
    public func humanPlayersTurn() {
        move(getUserMove())
    }
    
    private func getUserMove() -> Int {
        print("\nPlease enter your input [0-8]:")
        let response = Int(readLine(stripNewline: true)!)
        return response!
    }
    
    public func move(cell: Int) {
        if playerOnesTurn() {
            gameBoard.move(cell, cellStatus: .PlayerOne)
        } else {
            gameBoard.move(cell, cellStatus: .PlayerTwo)
        }

    }
    
    private func playerOnesTurn() -> Bool {
        return currentTurn()%2 == 1
    }
    
}
