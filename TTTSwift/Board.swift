public class Board {
    
    public enum Player {
        case PlayerOne
        case PlayerTwo
    }
    
    var marks = [Int: Player]()
    
    public init() {}

    public func currentMarks() -> [String] {
        var marksInCells = ["", "", "", "", "", "", "", "", ""]
        for (cell, player) in marks {
            if player == .PlayerOne {
                marksInCells[cell] = "X"
            } else {
                marksInCells[cell] = "O"
            }
        }
        return marksInCells
    }
    
    public func forEachMarkByRow(f: String -> String) -> [[String]] {
        let u = currentMarks().map(f)
        return [[u[0], u[1], u[2]], [u[3], u[4], u[5]], [u[6], u[7], u[8]]]
    }

    public func move(cell: Int, player: Player) {
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
