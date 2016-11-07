open class GameFactory {

    public static func newGame() -> (Game, Board) {
        let board = Board()
        let game = Game(board: board)
        return (game, board)
    }

    static func updateGame(game: Game, type: GameType) {
        switch type {
        case .humanVsHuman:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = HumanPlayer()
        case .humanVsComputer:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = FirstAvailableSpotComputerPlayer()
        case .computerVsHuman:
            game.firstPlayerType = FirstAvailableSpotComputerPlayer()
            game.secondPlayerType = HumanPlayer()
        case .computerVsComputer:
            game.firstPlayerType = FirstAvailableSpotComputerPlayer()
            game.secondPlayerType = FirstAvailableSpotComputerPlayer()
        }
        
    }
    
}
