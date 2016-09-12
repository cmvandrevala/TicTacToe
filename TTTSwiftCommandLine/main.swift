var gameBoard = Board()
let rules = Rules(board: gameBoard)
var manager = IOManager(board: gameBoard)
var printer = BoardPrinter(board: gameBoard)

printer.printFormattedBoardForConsole()

while !rules.gameIsOver() {
    manager.humanPlayersTurn()
    rules.updateGameStatus()
    manager.incrementTurn()
    printer.printFormattedBoardForConsole()
}