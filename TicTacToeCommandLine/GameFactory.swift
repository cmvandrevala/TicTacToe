open class GameFactory {

    public enum GameType {
        case humanVsHuman
        case humanVsComputer
        case computerVsHuman
        case computerVsComputer
    }

    public static func newGame() -> (Game?, Board?) {
        return newGame(type: .computerVsComputer)
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
        }
        
    }
    
}
