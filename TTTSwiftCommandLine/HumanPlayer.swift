open class HumanPlayer: Player {
    
    open var wantsToContinuePlaying: Bool = true
    
    public init() {}
    
    open func noLongerWantsToPlay() {
        wantsToContinuePlaying = !wantsToContinuePlaying
    }
    
    open func getMove(_ board: Board) -> Int? {
        let inputReader = TTTMoveReader(board: board)
        return Int(inputReader.getInput()!)
    }
    
    
}
