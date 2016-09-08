public class Board {
    
    var marks = [Int: String]()
    
    public init() {}

    public func current_marks() -> [String] {
        var marks_in_cells = ["", "", "", "", "", "", "", "", ""]
        for (cell, player) in marks {
            marks_in_cells[cell] = player
        }
        return marks_in_cells
    }
    
    public func forEachMarkByRow(f: String -> String) -> [[String]] {
        let u = current_marks().map(f)
        return [[u[0], u[1], u[2]], [u[3], u[4], u[5]], [u[6], u[7], u[8]]]
    }

    public func move(cell: Int, player: String) {
        if valid_cell(cell) && empty_cell(cell) {
            marks[cell] = player
        }
    }
    
    private func valid_cell(cell: Int) -> Bool {
        switch cell {
        case let x where x < 0:
            return false
        case let x where x > 8:
            return false
        default:
            return true
        }
    }
    
    private func empty_cell(cell: Int) -> Bool {
        for (potential_occupied_cell,_) in marks {
            if potential_occupied_cell == cell {
                return false
            }
        }
        return true
    }
    
}
