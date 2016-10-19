import UIKit

public class GameViewController: UIViewController {

    var game: Game?
    var board: Board?

    public var gameType = GameType()

    @IBOutlet weak public var cell0: UIButton!
    @IBOutlet weak public var cell1: UIButton!
    @IBOutlet weak public var cell2: UIButton!
    @IBOutlet weak public var cell3: UIButton!
    @IBOutlet weak public var cell4: UIButton!
    @IBOutlet weak public var cell5: UIButton!
    @IBOutlet weak public var cell6: UIButton!
    @IBOutlet weak public var cell7: UIButton!
    @IBOutlet weak public var cell8: UIButton!

    @IBOutlet weak public var messages: UILabel!

    override public func viewDidLoad() {
        super.viewDidLoad()
        (game, board) = GameFactory.newGame()
        GameFactory.updateGame(game: game!, type: gameType)
        clearAndPlayGame()
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled && game!.isCurrentPlayerHuman {
            humanMove(sender: sender)
            if game!.isInProgress() && !game!.isCurrentPlayerHuman {
                disableAllCells()
                computerMove()
            }
        }
        refresh()
    }

    @IBAction public func clearAndPlayGame() {
        game!.clear()
        if game!.isInProgress() && !game!.isCurrentPlayerHuman {
            computerPlayerMakesMove(player: game!.firstPlayerType)
        }
        refresh()
    }

    fileprivate func humanMove(sender: UIButton) {
        let move = Int(sender.tag)
        game!.takeTurn(cellIndex: move)
        game!.endTurn()
    }

    @objc fileprivate func computerMove() {
        switch gameType {
        case .humanVsComputer:
            computerPlayerMakesMove(player: game!.secondPlayerType)
        case .computerVsHuman:
            computerPlayerMakesMove(player: game!.firstPlayerType)
        default:
            break
        }
        refresh()
    }

    fileprivate func computerPlayerMakesMove(player: Player) {
        let move = player.getMove(board: board!)
        game!.takeTurn(cellIndex: move!)
        game!.endTurn()
    }

    fileprivate func refresh() {
        refreshBoard()
        refreshMessages()
    }

    fileprivate func refreshBoard() {
        refreshAllCells()
        if !game!.isInProgress() {
            disableAllCells()
        }
    }

    fileprivate func disableAllCells() {
        let cells = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            if let cell = cell {
                cell.isEnabled = false
            }
        }
    }

    @objc fileprivate func refreshAllCells() {
        let cells = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            if let cell = cell {
                refreshSingleCell(cell: cell)
            }
        }
    }

    fileprivate func refreshSingleCell(cell: UIButton) {
        let currentBoard = board!.currentBoard()
        switch currentBoard[Int(cell.tag)] {
        case .playerOne:
            cell.setTitle(game!.marks.playerOnesMark, for: .normal)
            cell.isEnabled = false
        case .playerTwo:
            cell.setTitle(game!.marks.playerTwosMark, for: .normal)
            cell.isEnabled = false
        case .empty:
            cell.setTitle(game!.marks.blankMark, for: .normal)
            cell.isEnabled = true
        }
    }

    fileprivate func refreshMessages() {
        messages.text = game!.iOSMessage()
    }

}

