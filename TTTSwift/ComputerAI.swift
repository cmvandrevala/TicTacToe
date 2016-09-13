public class ComputerAI {
    
    public init() {}
    
    public func move(board: Board) -> Int? {
        let currentBoard = board.currentBoard()
        for (indx, status) in currentBoard.enumerate() {
            if status == .Empty {
                return indx
            }
        }
        return nil
    }

}