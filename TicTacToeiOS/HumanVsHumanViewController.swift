import UIKit

public class HumanVsHumanViewController: UIViewController {

    var game: Game!
    var board: Board!
    var ticTacToeMessages: TicTacToeMessages!

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
        board = Board()
        game = Game(board: board)
        ticTacToeMessages = TicTacToeMessages()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newGame()
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled {
            game.takeTurn(cellIndex: Int(sender.tag))
            refreshBoard()
            refreshMessages()
        }
    }

    @IBAction public func newGame() {
        game.clear()
        refreshBoard()
        messages.text = ticTacToeMessages.itsPlayerOnesTurn(playerOnesMark: "X")
    }

    fileprivate func refreshBoard() {
        let cells: [UIButton?] = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            if let cell = cell {
                refreshCell(cell: cell)
            }
        }
        if !game.isInProgress() {
            for cell in cells {
                if let cell = cell {
                    cell.isEnabled = false
                }
            }
        }
    }

    fileprivate func refreshMessages() {
        if game.isInProgress() {
            if messages.text == ticTacToeMessages.itsPlayerOnesTurn(playerOnesMark: "X") {
                messages.text = ticTacToeMessages.itsPlayerTwosTurn(playerTwosMark: "O")
            } else {
                messages.text = ticTacToeMessages.itsPlayerOnesTurn(playerOnesMark: "X")
            }
        } else {
            messages.text = ticTacToeMessages.theGameHasEnded
        }
    }

    fileprivate func refreshCell(cell: UIButton) {
        let currentBoard = board.currentBoard()
        switch currentBoard[Int(cell.tag)] {
        case .playerOne:
            cell.setTitle(game.marks.playerOnesMark, for: .normal)
            cell.isEnabled = false
        case .playerTwo:
            cell.setTitle(game.marks.playerTwosMark, for: .normal)
            cell.isEnabled = false
        case .empty:
            cell.setTitle("", for: .normal)
            cell.isEnabled = true
        }
    }

}

