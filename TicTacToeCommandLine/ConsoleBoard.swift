import Foundation

open class ConsoleBoard {

    var marks: PlayerMarks!
    var gameBoard: Board
    
    public init(board: Board) {
        marks = PlayerMarks()
        gameBoard = board
    }
    
    open func formattedBoardForConsole() -> String {
        var boardString = emptyFormattedBoard()
        for (index, mark) in currentMarks().enumerated() {
            boardString = boardString.replacingOccurrences(of: "\(index)", with: mark)
        }
        return boardString
    }
    
    fileprivate func emptyFormattedBoard() -> String {
        return "\nThe current board is:\n\n 0 | 1 | 2 \n===========\n 3 | 4 | 5 \n===========\n 6 | 7 | 8 \n"
    }
    
    fileprivate func currentMarks() -> [String] {
        var marksInCells: [String] = []
        for (index,status) in gameBoard.currentBoard().enumerated() {
            if status == .playerOne {
                marksInCells.append(marks.playerOnesMark)
            } else if status == .playerTwo {
                marksInCells.append(marks.playerTwosMark)
            } else {
                marksInCells.append("\(index)")
            }
        }
        return marksInCells
    }
    
}
