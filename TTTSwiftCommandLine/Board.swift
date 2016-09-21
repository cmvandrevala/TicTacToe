public class Board {
    
    public enum CellStatus {
        case PlayerOne
        case PlayerTwo
        case Empty
    }
    
    let numberOfCells = 9
    var currentCells = [Int: CellStatus]()
    
    public init() {
        for cell in 0...numberOfCells - 1 {
            currentCells[cell] = .Empty
        }
    }
    
    public func currentBoard() -> [CellStatus] {
        var marksInCells = [CellStatus](count: 9, repeatedValue: .Empty)
        for (cell, status) in currentCells {
            marksInCells[cell] = status
        }
        return marksInCells
    }
    
    public func move(cellIndex: Int, cellStatus: CellStatus) {
        currentCells[cellIndex] = cellStatus
    }
    
    public func rowsOfCells() -> [[CellStatus]] {
        let u = currentBoard()
        return [ [u[0], u[1], u[2] ], [ u[3], u[4], u[5] ], [ u[6], u[7], u[8] ] ]
    }
    
    public func threeInRow() -> CellStatus {
        for group in groupsOfThreeCells() {
            if areAllThreeCellsMatching(group) && areAllThreeCellsFilled(group) {
                return currentCells[group[0]]!
            }
        }
        return .Empty
    }
    
    public func isFilled() -> Bool {
        return !currentBoard().contains(.Empty)
    }
    
    public func isEmptyCellAtIndex(cellIndex: Int) -> Bool {
        switch currentCells[cellIndex]! {
        case .PlayerOne:
            return false
        case .PlayerTwo:
            return false
        case .Empty:
            return true
        }
    }
    
    public func clear() {
        for cell in 0...numberOfCells - 1 {
            currentCells[cell] = .Empty
        }
    }
    
    private func areAllThreeCellsMatching(group: [Int]) -> Bool {
        let marks = marksContainedInGroup(group)
        return marks[0] == marks[1] && marks[1] == marks[2]
    }
    
    private func areAllThreeCellsFilled(group: [Int]) -> Bool {
        let marks = marksContainedInGroup(group)
        return marks[0] != .Empty && marks[1] != .Empty && marks[2] != .Empty
    }
    
    private func marksContainedInGroup(group: [Int]) -> [CellStatus] {
        let firstMark = currentCells[group[0]]!
        let secondMark = currentCells[group[1]]!
        let thirdMark = currentCells[group[2]]!
        return [firstMark, secondMark, thirdMark]
    }
    
    private func groupsOfThreeCells() -> [[Int]] {
        return rows() + columns() + diagonals()
    }

    private func rows() -> [[Int]] {
        return [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
    }
    
    private func columns() -> [[Int]] {
        return [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
    }
    
    private func diagonals() -> [[Int]] {
        return [ [0, 4, 8], [2, 4, 6] ]
    }
    
}
