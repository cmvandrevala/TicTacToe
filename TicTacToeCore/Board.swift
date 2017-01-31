open class Board {
    
    public enum CellStatus {
        case playerOne
        case playerTwo
        case empty
    }
    
    open let numberOfCells = 9

    private var currentCells = [Int: CellStatus]()
    private var patterns = BoardPatterns()
    private let emptyJSONString = "{\"moves\": []}"

    public init() {
        clear()
    }
    
    open func currentBoard() -> [CellStatus] {
        var marksInCells = [CellStatus](repeating: .empty, count: numberOfCells)
        for (cell, status) in currentCells {
            marksInCells[cell] = status
        }
        return marksInCells
    }
    
    open func currentBoardJSON() -> String {
        if(boardIsEmpty()) {
            return emptyJSONString
        } else {
            return formattedJSONString()
        }
    }
    
    open func move(cellIndex: Int, cellStatus: CellStatus) {
        currentCells[cellIndex] = cellStatus
    }

    open func threeInRow() -> CellStatus {
        for group in patterns.groupsOfThreeCells() {
            if areAllCellsMatching(group: group) && areAllCellsFilled(group: group) {
                return currentCells[group[0]]!
            }
        }
        return .empty
    }
    
    open func isFilled() -> Bool {
        return !currentBoard().contains(.empty)
    }
    
    open func isEmptyCellAtIndex(cellIndex: Int) -> Bool {
        return currentCells[cellIndex]! == .empty
    }
    
    open func clear() {
        for cell in 0...numberOfCells - 1 {
            currentCells[cell] = .empty
        }
    }
    
    fileprivate func formattedJSONString() -> String {
        var rawOutputString = "{\"moves\": ["
        for move in filledCells() {
            rawOutputString = "\(rawOutputString)\(move), "
        }
        let endIndex = rawOutputString.index(rawOutputString.endIndex, offsetBy: -2)
        let truncatedOutputString = rawOutputString.substring(to: endIndex)
        return "\(truncatedOutputString)]}"
    }
    
    fileprivate func boardIsEmpty() -> Bool {
        return filledCells().count == 0
    }
    
    fileprivate func filledCells() -> [String] {
        let moveArray = currentBoard().enumerated().map { (index, element) in cellToJSON(index: index, element: element) }
        return moveArray.filter { $0 != "" }
    }
    
    fileprivate func cellToJSON(index: Int, element: CellStatus) -> String {
        switch(element) {
        case .playerOne:
            return "{\"player_one\": \(index)}"
        case .playerTwo:
            return "{\"player_two\": \(index)}"
        case .empty:
            return ""
        }
    }
    
    fileprivate func areAllCellsMatching(group: [Int]) -> Bool {
        let marks = marksContainedInGroup(group: group)
        return marks[0] == marks[1] && marks[1] == marks[2]
    }
    
    fileprivate func areAllCellsFilled(group: [Int]) -> Bool {
        let marks = marksContainedInGroup(group: group)
        return marks[0] != .empty && marks[1] != .empty && marks[2] != .empty
    }
    
    fileprivate func marksContainedInGroup(group: [Int]) -> [CellStatus] {
        let firstMark = currentCells[group[0]]!
        let secondMark = currentCells[group[1]]!
        let thirdMark = currentCells[group[2]]!
        return [firstMark, secondMark, thirdMark]
    }
    
}
