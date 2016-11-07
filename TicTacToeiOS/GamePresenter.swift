public class GamePresenter {

    public var board: Board
    public var game: Game
    public var gameType = GameType()

    public init() {
        (game, board) = GameFactory.newGame()
    }

    public func setGameType(gameType: GameType) {
        self.gameType = gameType
        GameFactory.updateGame(game: game, type: gameType)
    }

    public var currentMessage: String {
        get {
            return game.iOSMessage()
        }
    }

    public func playerMoved(move: Int) {
        humanMove(move: move)
        if game.isInProgress() && !game.isCurrentPlayerHuman {
            computerMove()
        }
    }

    fileprivate func humanMove(move: Int) {
        game.takeTurn(cellIndex: move)
        game.endTurn()
    }

    fileprivate func computerMove() {
        switch gameType {
        case .humanVsComputer:
            computerPlayerMakesMove(player: game.secondPlayerType)
        case .computerVsHuman:
            computerPlayerMakesMove(player: game.firstPlayerType)
        default:
            break
        }
    }

    fileprivate func computerPlayerMakesMove(player: Player) {
        let move = player.getMove(board: board)
        game.takeTurn(cellIndex: move!)
        game.endTurn()
    }

}
