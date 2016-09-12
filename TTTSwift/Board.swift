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
    
    public func rowsOfCells() -> [[CellStatus]] {
        let temp = currentBoard()
        let marksInCells = [[temp[0], temp[1], temp[2]], [temp[3], temp[4], temp[5]], [temp[6], temp[7], temp[8]]]
        return marksInCells
    }
    
    public func threeInRow() -> Bool {
        for triple in rows() + columns() + diagonals() {
            if currentCells[triple[0]] == currentCells[triple[1]] && currentCells[triple[1]] == currentCells[triple[2]] && currentCells[triple[0]] != .Empty {
                return true
            }
        }
        return false
    }
    
    public func filledBoard() -> Bool {
        if currentBoard().contains(.Empty) {
            return false
        } else {
            return true
        }
    }
    
    public func move(cell: Int, cellStatus: CellStatus) {
        if validCell(cell) && emptyCell(cell) {
            currentCells[cell] = cellStatus
        }
    }
    
    public func emptyCell(cell: Int) -> Bool {
        if currentCells[cell] == .Empty {
            return true
        }
        return false
    }
    
    private func validCell(cell: Int) -> Bool {
        switch cell {
        case let x where x < 0:
            return false
        case let x where x > 8:
            return false
        default:
            return true
        }
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
