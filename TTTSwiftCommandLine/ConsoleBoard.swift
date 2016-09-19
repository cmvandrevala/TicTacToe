public class ConsoleBoard {
    
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    public func formattedBoardForConsole() -> String {
        var formattedString = ""
        let paddedMarks = forEachMarkByRow(padMark)
        for (index, row) in paddedMarks.enumerate() {
            formattedString = addRowOfMarks(formattedString, row: row)
            if haveNotReachedLastRowOfBoard(index) {
                formattedString = addHorizontalLine(formattedString)
            }
        }
        return formattedString
    }
    
    private func haveNotReachedLastRowOfBoard(index: Int) -> Bool {
        return index < 2
    }
    
    private func addRowOfMarks(formattedString: String, row: [String]) -> String{
        let formattedRow = "\(row[0])|\(row[1])|\(row[2])"
        return "\(formattedString)\(formattedRow)"
    }
    
    private func addHorizontalLine(formattedString: String) -> String {
        let horizontalLine = "\n===========\n"
        return "\(formattedString)\(horizontalLine)"
    }
    
    private func padMark(mark: String) -> String {
        if mark == "" {
            return "   "
        } else {
            return " \(mark) "
        }
    }
    
    private func forEachMarkByRow(f: String -> String) -> [[String]] {
        let marks = currentMarks()
        let u = marks.map(f)
        return [ [u[0], u[1], u[2]], [u[3], u[4], u[5]], [u[6], u[7], u[8]] ]
    }
    
    private func currentMarks() -> [String] {
        var marksInCells: [String] = []
        for status in gameBoard.currentBoard() {
            if status == .PlayerOne {
                marksInCells.append("X")
            } else if status == .PlayerTwo {
                marksInCells.append("O")
            } else {
                marksInCells.append("")
            }
        }
        return marksInCells
    }
    
}