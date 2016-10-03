open class FirstAvailableSpotComputerPlayer: Player {
    
    public init() {}
    
    open func getMove(board: Board) -> Int? {
        return board.currentBoard().index(of: .empty)
    }

}
