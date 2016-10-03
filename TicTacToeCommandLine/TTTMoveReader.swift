open class TTTMoveReader: ConsoleInputReader {
    
    public enum InputClassification {
        case passed
        case nonInteger
        case tooLarge
        case tooSmall
        case cellTaken
    }
    
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    open func getInput() -> String? {
        print("\nPlease enter your input [0-8]:")
        let response = readLine(strippingNewline: true)!
        switch checkInput(cell: response) {
        case .passed:
            return response
        case .nonInteger:
            print("That is not an integer input! Try again.")
            return getInput()
        case .tooLarge:
            print("That integer is way too big!")
            return getInput()
        case .tooSmall:
            print("That integer is way too small!")
            return getInput()
        case .cellTaken:
            print("That space has already been taken!")
            return getInput()
        }
    }
    
    open func checkInput(cell: String) -> InputClassification {
        switch Int(cell) {
        case nil:
            return .nonInteger
        case let x where x! > 8:
            return .tooLarge
        case let x where x! < 0:
            return .tooSmall
        case let x where gameBoard.isEmptyCellAtIndex(cellIndex: x!) == false:
            return .cellTaken
        default:
            return .passed
        }
    }
    
}
