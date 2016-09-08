public class Board {
    
    var marks = [Int: String]()
    
    public init() {}

    public func currentMarks() -> [String] {
        var marksInCells = ["", "", "", "", "", "", "", "", ""]
        for (cell, player) in marks {
            marksInCells[cell] = player
        }
        return marksInCells
    }
    
    public func forEachMarkByRow(f: String -> String) -> [[String]] {
        let u = currentMarks().map(f)
        return [[u[0], u[1], u[2]], [u[3], u[4], u[5]], [u[6], u[7], u[8]]]
    }

    public func move(cell: Int, player: String) {
        if validCell(cell) && emptyCell(cell) {
            marks[cell] = player
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
        for (potentialOccupiedCell,_) in marks {
            if potentialOccupiedCell == cell {
                return false
            }
        }
        return true
    }
    
}
