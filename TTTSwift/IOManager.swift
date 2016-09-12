public class IOManager {
    
    public enum InputClassification {
        case Passed
        case NonInteger
        case TooLarge
        case TooSmall
        case CellTaken
    }

    var turn = 1
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    public func checkInput(cell: String) -> InputClassification {
        switch Int(cell) {
        case nil:
            return .NonInteger
        case let x where x > 8:
            return .TooLarge
        case let x where x < 0:
            return .TooSmall
        default:
            if !gameBoard.emptyCell(Int(cell)!) {
                return .CellTaken
            } else {
                return .Passed
            }
        }

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
    
    public func move(cell: Int) {
        if playerOnesTurn() {
            gameBoard.move(cell, cellStatus: .PlayerOne)
        } else {
            gameBoard.move(cell, cellStatus: .PlayerTwo)
        }

    }
    
    private func getUserMove() -> Int {
        print("\nPlease enter your input [0-8]:")
        let response = readLine(stripNewline: true)!
        switch checkInput(response) {
        case .Passed:
            return Int(response)!
        case .NonInteger:
            print("That is not an integer input! Try again.")
            return getUserMove()
        case .TooLarge:
            print("That integer is way too big!")
            return getUserMove()
        case .TooSmall:
            print("That integer is way too small!")
            return getUserMove()
        case .CellTaken:
            print("That space has already been taken!")
            return getUserMove()
        }
            
    }
    
    private func playerOnesTurn() -> Bool {
        return currentTurn()%2 == 1
    }
    
}
