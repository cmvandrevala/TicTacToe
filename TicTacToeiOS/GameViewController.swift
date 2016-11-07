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
        presenter = GamePresenter(viewController: self)
        presenter?.setGameType(gameType: gameType)
        presenter?.clearAndStartGame()
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled {
            presenter?.playerMoved(move: Int(sender.tag))
        }
    }

    @IBAction func newGame() {
        presenter?.clearAndStartGame()
    }

    public func cells() -> [UIButton?] {
        return [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
    }

    public func refresh() {
        refreshBoard()
        refreshMessages()
    }

    fileprivate func refreshBoard() {
        refreshAllCells()
        if (presenter?.gameIsOver())! {
            disableAllCells()
        }
    }

    public func disableAllCells() {
        for cell in cells() {
            if let cell = cell {
                cell.isEnabled = false
            }
        }
    }

    fileprivate func refreshAllCells() {
        for cell in cells() {
            if let cell = cell {
                presenter?.refreshSingleCell(cell: cell)
            }
        }
    }

    fileprivate func refreshMessages() {
        messages.text = presenter?.currentMessage
    }

}

