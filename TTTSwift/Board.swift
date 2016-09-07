public class Board {
    
    var marks = [String: Int]()

    func current_marks() -> [String] {
        var marks_in_cells = ["", "", "", "", "", "", "", "", ""]
        for (player, cell) in marks {
            marks_in_cells[cell] = player
        }
        return marks_in_cells
    }

    func move(cell: Int, player: String) {
        if valid_cell(cell) && empty_cell(cell) {
            marks[player] = cell
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
        for (_,potential_occupied_cell) in marks {
            if potential_occupied_cell == cell {
                return false
            }
        }
        return true
    }
    
}
