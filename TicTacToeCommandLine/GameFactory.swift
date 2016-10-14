open class GameFactory {

    public static func newGame() -> (Game?, Board?) {
        return newGame(type: .unassigned)
    }

    public static func newGame(type: GameType) -> (Game?, Board?) {
        let gameBoard = Board()
        let game = Game(board: gameBoard)
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
        case .unassigned:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = HumanPlayer()
        }
        return (game, gameBoard)
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
        case .unassigned:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = HumanPlayer()
        }
        
    }
    
}
