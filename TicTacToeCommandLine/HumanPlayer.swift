open class HumanPlayer: Player {
    
    open var wantsToContinuePlaying: Bool = true
    
    public init() {}
    
    open func noLongerWantsToPlay() {
        wantsToContinuePlaying = !wantsToContinuePlaying
    }
    
    open func makeMove(game: Game) {
        let inputReader = TTTMoveReader(board: game.gameBoard)
        let cellIndex = Int(inputReader.getInput()!)
        game.takeTurn(cellIndex: cellIndex!)
    }
    
    
}
