public class UserInputRetriever {
    
    public enum InputClassification {
        case Passed
        case NonInteger
        case TooLarge
        case TooSmall
        case CellTaken
    }
    
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    public func getUserMove() -> Int {
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
    
    public func checkInput(cell: String) -> InputClassification {
        switch Int(cell) {
        case nil:
            return .NonInteger
        case let x where x > 8:
            return .TooLarge
        case let x where x < 0:
            return .TooSmall
        case let x where gameBoard.isEmptyCellAtIndex(x!) == false:
            return .CellTaken
        default:
            return .Passed
        }
    }
    
}
