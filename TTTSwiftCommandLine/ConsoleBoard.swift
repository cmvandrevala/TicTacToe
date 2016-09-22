import Foundation

public class ConsoleBoard {
    
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    public func formattedBoardForConsole() -> String {
        var boardString = emptyFormattedBoard()
        for (index, mark) in currentMarks().enumerate() {
            boardString = boardString.stringByReplacingOccurrencesOfString("\(index)", withString: mark)
        }
        return boardString
    }
    
    private func emptyFormattedBoard() -> String {
        return "\nThe current board is:\n\n 0 | 1 | 2 \n===========\n 3 | 4 | 5 \n===========\n 6 | 7 | 8 "
    }
    
    private func currentMarks() -> [String] {
        var marksInCells: [String] = []
        for (index,status) in gameBoard.currentBoard().enumerate() {
            if status == .PlayerOne {
                marksInCells.append("X")
            } else if status == .PlayerTwo {
                marksInCells.append("O")
            } else {
                marksInCells.append("\(index)")
            }
        }
        return marksInCells
    }
    
}
