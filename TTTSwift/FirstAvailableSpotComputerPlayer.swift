public class FirstAvailableSpotComputerPlayer: Player {
    
    public init() {}
    
    public func getMove(board: Board) -> Int? {
        return board.currentBoard().indexOf(.Empty)
    }

}