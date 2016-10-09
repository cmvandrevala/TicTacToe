open class TTTMoveReader: InputReader {
    
    public enum InputClassification {
        case passed
        case nonInteger
        case tooLarge
        case tooSmall
        case cellTaken
    }
    
    var gameBoard: Board
    var messages: TicTacToeMessages
    
    public init(board: Board) {
        gameBoard = board
        messages = TicTacToeMessages()
    }
    
    open func getInput() -> String? {
        print(messages.selectCellPrompt)
        let response = readLine(strippingNewline: true)!
        switch checkInput(cell: response) {
        case .passed:
            return response
        case .nonInteger:
            print(messages.notAnIntegerInput)
            return getInput()
        case .tooLarge:
            print(messages.selectedCellIndexTooLarge)
            return getInput()
        case .tooSmall:
            print(messages.selectedCellIndexTooSmall)
            return getInput()
        case .cellTaken:
            print(messages.cellIsTaken)
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


