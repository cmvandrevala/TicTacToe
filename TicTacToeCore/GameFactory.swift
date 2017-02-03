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
            game.secondPlayerType = NetworkComputerPlayer()
        case .computerVsHuman:
            game.firstPlayerType = NetworkComputerPlayer()
            game.secondPlayerType = HumanPlayer()
        case .computerVsComputer:
            game.firstPlayerType = NetworkComputerPlayer()
            game.secondPlayerType = NetworkComputerPlayer()
        }
        
    }
    
}
