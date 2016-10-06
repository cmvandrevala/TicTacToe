import UIKit

public class HumanVsHumanViewController: UIViewController {

    var game: Game!
    var board: Board!

    @IBOutlet weak public var cell0: UIButton!
    @IBOutlet weak public var cell1: UIButton!
    @IBOutlet weak public var cell2: UIButton!
    @IBOutlet weak public var cell3: UIButton!
    @IBOutlet weak public var cell4: UIButton!
    @IBOutlet weak public var cell5: UIButton!
    @IBOutlet weak public var cell6: UIButton!
    @IBOutlet weak public var cell7: UIButton!
    @IBOutlet weak public var cell8: UIButton!

    override public func viewDidLoad() {
        super.viewDidLoad()
        board = Board()
        game = Game(board: board)
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled {
            let cellIndex = Int(sender.tag)
            game.takeTurn(cellIndex: cellIndex)
            refreshBoard()
        }
    }

    @IBAction public func newGame() {
        game.clear()
        refreshBoard()
    }

    fileprivate func refreshBoard() {
        let cells: [UIButton?] = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            if let cell = cell {
                refreshCell(cell: cell)
            }
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

