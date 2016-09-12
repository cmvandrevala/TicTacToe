public class BoardPrinter {
    
    public init() {}
    
    public func formattedBoardForConsole(board: Board) -> String {
        var formattedString = ""
        let paddedMarks = forEachMarkByRow(board, f: padMark)
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
    
    private func forEachMarkByRow(board: Board, f: String -> String) -> [[String]] {
        let marks = board.currentMarks()
        let u = marks.map(f)
        return [ [u[0], u[1], u[2]], [u[3], u[4], u[5]], [u[6], u[7], u[8]] ]
    }

    
}