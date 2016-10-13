import UIKit

public class GameViewController: UIViewController {

    var game: Game!
    var board: Board!

    public enum GameType {
        case humanVsHuman
        case humanVsComputer
        case computerVsHuman
    }

    public var gameType: GameType = .humanVsHuman

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
        newGame()
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled && game.isCurrentPlayerHuman {
            let humanMove = Int(sender.tag)
            game.takeTurn(cellIndex: humanMove)
            game.endTurn()
            if game.isInProgress() && !game.isCurrentPlayerHuman && gameType == .humanVsComputer {
                let computerMove = game.secondPlayerType.getMove(board: board)
                game.takeTurn(cellIndex: computerMove!)
                game.endTurn()
            }
            if game.isInProgress() && !game.isCurrentPlayerHuman && gameType == .computerVsHuman {
                let computerMove = game.firstPlayerType.getMove(board: board)
                game.takeTurn(cellIndex: computerMove!)
                game.endTurn()
            }
        }
        refresh()
    }

    @IBAction public func newGame() {
        switch gameType {
        case .humanVsHuman:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = HumanPlayer()
        case .humanVsComputer:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = FirstAvailableSpotComputerPlayer()
        case .computerVsHuman:
            game.firstPlayerType = FirstAvailableSpotComputerPlayer()
            game.secondPlayerType = HumanPlayer()
        }
        game.clear()
        if game.isInProgress() && !game.isCurrentPlayerHuman {
            let computerMove = game.firstPlayerType.getMove(board: board)
            game.takeTurn(cellIndex: computerMove!)
            game.endTurn()
        }
        refresh()
    }

    fileprivate func refresh() {
        refreshBoard()
        refreshMessages()
    }

    fileprivate func refreshBoard() {
        let cells: [UIButton?] = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]
        for cell in cells {
            if let cell = cell {
                refreshCell(cell: cell)
                if !game.isInProgress() {
                    cell.isEnabled = false
                }
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
            cell.setTitle(game.marks.blankMark, for: .normal)
            cell.isEnabled = true
        }
    }

    fileprivate func refreshMessages() {
        messages.text = game.iOSMessage()
    }

}

