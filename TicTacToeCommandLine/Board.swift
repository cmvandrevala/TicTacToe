open class Board {
    
    public enum CellStatus {
        case playerOne
        case playerTwo
        case empty
    }
    
    let numberOfCells = 9
    var currentCells = [Int: CellStatus]()
    
    public init() {
        for cell in 0...numberOfCells - 1 {
            currentCells[cell] = .empty
        }
    }
    
    open func currentBoard() -> [CellStatus] {
        var marksInCells = [CellStatus](repeating: .empty, count: 9)
        for (cell, status) in currentCells {
            marksInCells[cell] = status
        }
        return marksInCells
    }
    
    open func move(cellIndex: Int, cellStatus: CellStatus) {
        currentCells[cellIndex] = cellStatus
    }
    
    open func rowsOfCells() -> [[CellStatus]] {
        let u = currentBoard()
        return [ [u[0], u[1], u[2] ], [ u[3], u[4], u[5] ], [ u[6], u[7], u[8] ] ]
    }
    
    open func threeInRow() -> CellStatus {
        for group in groupsOfThreeCells() {
            if areAllThreeCellsMatching(group: group) && areAllThreeCellsFilled(group: group) {
                return currentCells[group[0]]!
            }
        }
        return .empty
    }
    
    open func isFilled() -> Bool {
        return !currentBoard().contains(.empty)
    }
    
    open func isEmptyCellAtIndex(cellIndex: Int) -> Bool {
        switch currentCells[cellIndex]! {
        case .playerOne:
            return false
        case .playerTwo:
            return false
        case .empty:
            return true
        }
    }
    
    open func clear() {
        for cell in 0...numberOfCells - 1 {
            currentCells[cell] = .empty
        }
    }
    
    fileprivate func areAllThreeCellsMatching(group: [Int]) -> Bool {
        let marks = marksContainedInGroup(group: group)
        return marks[0] == marks[1] && marks[1] == marks[2]
    }
    
    fileprivate func areAllThreeCellsFilled(group: [Int]) -> Bool {
        let marks = marksContainedInGroup(group: group)
        return marks[0] != .empty && marks[1] != .empty && marks[2] != .empty
    }
    
    fileprivate func marksContainedInGroup(group: [Int]) -> [CellStatus] {
        let firstMark = currentCells[group[0]]!
        let secondMark = currentCells[group[1]]!
        let thirdMark = currentCells[group[2]]!
        return [firstMark, secondMark, thirdMark]
    }
    
    fileprivate func groupsOfThreeCells() -> [[Int]] {
        return rows() + columns() + diagonals()
    }

    fileprivate func rows() -> [[Int]] {
        return [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
    }
    
    fileprivate func columns() -> [[Int]] {
        return [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
    }
    
    fileprivate func diagonals() -> [[Int]] {
        return [ [0, 4, 8], [2, 4, 6] ]
    }
    
}
