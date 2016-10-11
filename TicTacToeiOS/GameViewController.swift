import UIKit

public class GameViewController: UIViewController {

    var game: Game!
    var board: Board!
    var ticTacToeMessages: TicTacToeMessages!

    public enum GameType {
        case humanVsHuman
        case humanVsComputer
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
        ticTacToeMessages = TicTacToeMessages()
        newGame()
    }

    @IBAction public func playerTapsCell(_ sender: UIButton) {
        if sender.isEnabled && gameType == .humanVsHuman {
            let humanMove = Int(sender.tag)
            game.takeTurn(cellIndex: humanMove)
            refreshBoard()
            refreshMessages()
        }

        if sender.isEnabled && gameType == .humanVsComputer {
            let humanMove = Int(sender.tag)
            game.takeTurn(cellIndex: humanMove)
            refreshBoard()
            refreshMessages()
            if game.isInProgress() {
                let computerMove = game.secondPlayerType.getMove(board: board)
                game.takeTurn(cellIndex: computerMove!)
                refreshBoard()
                refreshMessages()
            }
        }
    }

    @IBAction public func newGame() {
        switch gameType {
        case .humanVsHuman:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = HumanPlayer()
        case .humanVsComputer:
            game.firstPlayerType = HumanPlayer()
            game.secondPlayerType = FirstAvailableSpotComputerPlayer()
        }
        game.clear()
        refreshBoard()
        messages.text = ticTacToeMessages.itsPlayerOnesTurn(playerOnesMark: game.marks.playerOnesMark)
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
            if game.currentPlayer == .playerTwo {
                messages.text = ticTacToeMessages.itsPlayerTwosTurn(playerTwosMark: game.marks.playerTwosMark)
            } else {
                messages.text = ticTacToeMessages.itsPlayerOnesTurn(playerOnesMark: game.marks.playerOnesMark)
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
            cell.setTitle(game.marks.blankMark, for: .normal)
            cell.isEnabled = true
        }
    }

}

