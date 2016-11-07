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
        clearAndStartGame()
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

    @IBAction public func clearAndStartGame() {
        presenter?.clearAndStartGame()
        refresh()
    }

    fileprivate func cells() -> [UIButton?] {
        return [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
    }

    fileprivate func refresh() {
        refreshBoard()
        refreshMessages()
    }

    fileprivate func refreshBoard() {
        refreshAllCells()
        if (presenter?.gameIsOver())! {
            disableAllCells()
        }
    }

    fileprivate func disableAllCells() {
        for cell in cells() {
            if let cell = cell {
                cell.isEnabled = false
            }
        }
    }

    fileprivate func refreshAllCells() {
        for cell in cells() {
            if let cell = cell {
                refreshSingleCell(cell: cell)
            }
        }
    }

    fileprivate func refreshSingleCell(cell: UIButton) {
        let currentBoard = presenter!.board.currentBoard()
        switch currentBoard[Int(cell.tag)] {
        case .playerOne:
            cell.setTitle(presenter?.playerOnesMark, for: .normal)
            cell.isEnabled = false
        case .playerTwo:
            cell.setTitle(presenter?.playerTwosMark, for: .normal)
            cell.isEnabled = false
        case .empty:
            cell.setTitle(presenter?.blankMark, for: .normal)
            cell.isEnabled = true
        }
    }

    fileprivate func refreshMessages() {
        messages.text = presenter?.currentMessage
    }

}

