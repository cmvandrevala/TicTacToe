import UIKit

public class GamePresenter {

    private var board: Board
    private var game: Game
    private var gameType = GameType()
    private var view: GameViewController

    public init(viewController: GameViewController) {
        (game, board) = GameFactory.newGame()
        view = viewController
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

    public func disableCellsIfGameIsOver() {
        if !game.isInProgress() {
            view.disableAllCells()
        }
    }

    public func clearAndStartGame() {
        game.clear()
        if !game.isCurrentPlayerHuman {
            computerPlayerMakesMove(player: game.firstPlayerType)
        }
        view.refresh()
    }

    public func playerMoved(move: Int) {
        if game.isCurrentPlayerHuman {
            humanMove(move: move)
        }
        if game.isInProgress() && !game.isCurrentPlayerHuman {
            view.disableAllCells()
            computerMove()
        }
        view.refresh()
    }

    public func refreshSingleCell(cell: UIButton) {
        let currentBoard = board.currentBoard()
        switch currentBoard[Int(cell.tag)] {
        case .playerOne:
            cell.setTitle(game.marks.playerOnesMark, for: .normal)
            cell.isEnabled = false
        case .playerTwo:
            cell.setTitle(game.marks.playerTwosMark, for: .normal)
            cell.isEnabled = false
        case .empty:
            cell.setTitle(game.marks.blankMark, for: .normal)
            cell.isEnabled = true
        }
    }

    private func humanMove(move: Int) {
        game.takeTurn(cellIndex: move)
        game.endTurn()
    }

    private func computerMove() {
        switch gameType {
        case .humanVsComputer:
            computerPlayerMakesMove(player: game.secondPlayerType)
        case .computerVsHuman:
            computerPlayerMakesMove(player: game.firstPlayerType)
        default:
            break
        }
    }

    private func computerPlayerMakesMove(player: Player) {
        let networkPlayer = NetworkComputerPlayer(view: view)
        networkPlayer.makeMove(game: game)
    }

}
