import UIKit

class HumanVsHumanViewController: UIViewController {

    var board: Board!
    var clock: Clock!
    var rules: Rules!

    var firstPlayer: HumanPlayer!
    var secondPlayer: HumanPlayer!

    @IBOutlet weak var cell0: UIButton!
    @IBOutlet weak var cell1: UIButton!
    @IBOutlet weak var cell2: UIButton!
    @IBOutlet weak var cell3: UIButton!
    @IBOutlet weak var cell4: UIButton!
    @IBOutlet weak var cell5: UIButton!
    @IBOutlet weak var cell6: UIButton!
    @IBOutlet weak var cell7: UIButton!
    @IBOutlet weak var cell8: UIButton!

    var indicesToButtons: [Int : UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        board = Board()
        clock = Clock()
        rules = Rules(board: board)
        firstPlayer = HumanPlayer()
        secondPlayer = HumanPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playerTapsCell(_ sender: UIButton) {
        let cellIndex = Int(sender.tag)
        takeTurn(cellIndex: cellIndex)
        refreshBoard()
    }

    fileprivate func takeTurn(cellIndex: Int) {
        switch clock.playerOnesTurn() {
        case true:
            board.move(cellIndex: cellIndex, cellStatus: .playerOne)
        case false:
            board.move(cellIndex: cellIndex, cellStatus: .playerTwo)
        }
        endTurn()
    }

    fileprivate func endTurn() {
        clock.incrementTurnNumber()
        rules.updateGameStatus()
    }

    fileprivate func refreshBoard() {
        let cells: [UIButton] = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            refreshCell(cell: cell)
        }
    }

    fileprivate func refreshCell(cell: UIButton) {
        switch board.currentCells[Int(cell.tag)]! {
        case .playerOne:
            cell.setTitle("X", for: .normal)
        case .playerTwo:
            cell.setTitle("O", for: .normal)
        case .empty:
            cell.setTitle("", for: .normal)
        }
    }

}

