import Foundation

open class ConsoleBoard {

    var marks: PlayerMarks!
    var messages: TicTacToeMessages!
    var gameBoard: Board
    
    public init(board: Board) {
        marks = PlayerMarks()
        gameBoard = board
        messages = TicTacToeMessages()
    }
    
    open func formattedBoardForConsole() -> String {
        var boardString = messages.emptyConsoleBoard
        for (index, mark) in currentMarks().enumerated() {
            boardString = boardString.replacingOccurrences(of: "\(index)", with: mark)
        }
        return boardString
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
