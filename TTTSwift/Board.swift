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

    public func currentMarks() -> [String] {
        var marksInCells = ["", "", "", "", "", "", "", "", ""]
        for (cell, status) in currentCells {
            if status == .PlayerOne {
                marksInCells[cell] = "X"
            } else if status == .PlayerTwo {
                marksInCells[cell] = "O"
            }
        }
        return marksInCells
    }
    
    public func rowsOfCells() -> [[CellStatus]] {
        let temp = currentBoard()
        let marksInCells = [[temp[0], temp[1], temp[2]], [temp[3], temp[4], temp[5]], [temp[6], temp[7], temp[8]]]
        return marksInCells
    }
    
    public func move(cell: Int, cellStatus: CellStatus) {
        if validCell(cell) && emptyCell(cell) {
            currentCells[cell] = cellStatus
        }
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
    
    private func emptyCell(cell: Int) -> Bool {
        if currentCells[cell] == .Empty {
            return true
        }
        return false
    }
    
}
