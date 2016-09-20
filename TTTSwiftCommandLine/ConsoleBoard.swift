import Foundation

public class ConsoleBoard {
    
    var gameBoard: Board
    
    public init(board: Board) {
        gameBoard = board
    }
    
    public func formattedBoardForConsole() -> String {
        var formattedString = " 0 | 1 | 2 \n===========\n 3 | 4 | 5 \n===========\n 6 | 7 | 8 "
        for (indx, mark) in currentMarks().enumerate() {
            if mark == "X" || mark == "O" {
                formattedString = formattedString.stringByReplacingOccurrencesOfString("\(indx)", withString: mark)
            }
        }
        return formattedString
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
