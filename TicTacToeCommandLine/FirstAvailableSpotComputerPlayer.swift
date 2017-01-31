open class FirstAvailableSpotComputerPlayer: Player {
    
    public init() {}
    
    open func makeMove(game: Game) {
        if !game.gameBoard.isFilled() {
            let cellIndex = game.gameBoard.currentBoard().index(of: .empty)
            game.takeTurn(cellIndex: cellIndex!)
        }
    }

}
