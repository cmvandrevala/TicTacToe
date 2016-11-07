import UIKit

public class GameViewController: UIViewController {

    public var presenter: GamePresenter?
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
        presenter = GamePresenter()
        presenter?.setGameType(gameType: gameType)
        clearAndPlayGame()
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled && (presenter?.game.isCurrentPlayerHuman)! {
            let move = Int(sender.tag)
            presenter?.humanMove(move: move)
            if (presenter?.game.isInProgress())! && !(presenter?.game.isCurrentPlayerHuman)! {
                disableAllCells()
                presenter?.computerMove()
            }
        }
        refresh()
    }

    @IBAction public func clearAndPlayGame() {
        presenter?.game.clear()
        if (presenter?.game.isInProgress())! && !(presenter?.game.isCurrentPlayerHuman)! {
            computerPlayerMakesMove(player: (presenter?.game.firstPlayerType)!)
        }
        refresh()
    }

    fileprivate func computerPlayerMakesMove(player: Player) {
        let move = player.getMove(board: (presenter?.board)!)
        presenter?.game.takeTurn(cellIndex: move!)
        presenter?.game.endTurn()
    }

    fileprivate func refresh() {
        refreshBoard()
        refreshMessages()
    }

    fileprivate func refreshBoard() {
        refreshAllCells()
        if !(presenter?.game.isInProgress())! {
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

    fileprivate func refreshAllCells() {
        let cells = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            if let cell = cell {
                refreshSingleCell(cell: cell)
            }
        }
    }

    fileprivate func refreshSingleCell(cell: UIButton) {
        let currentBoard = presenter!.board.currentBoard()
        switch currentBoard[Int(cell.tag)] {
        case .playerOne:
            cell.setTitle(presenter?.game.marks.playerOnesMark, for: .normal)
            cell.isEnabled = false
        case .playerTwo:
            cell.setTitle(presenter?.game.marks.playerTwosMark, for: .normal)
            cell.isEnabled = false
        case .empty:
            cell.setTitle(presenter?.game.marks.blankMark, for: .normal)
            cell.isEnabled = true
        }
    }

    fileprivate func refreshMessages() {
        messages.text = presenter?.currentMessage
    }

}

