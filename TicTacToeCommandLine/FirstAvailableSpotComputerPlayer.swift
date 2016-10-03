open class FirstAvailableSpotComputerPlayer: Player {
    
    public init() {}
    
    open func getMove(_ board: Board) -> Int? {
        return board.currentBoard().index(of: .empty)
    }

}
