var clock = GameClock()
var board = Board()
let rules = Rules(board: board)
var manager = UserInputRetriever(board: board)
var printer = BoardPrinter(board: board)

printer.printFormattedBoardForConsole()

while !rules.gameIsOver() {
    manager.humanPlayersTurn(clock)
    rules.updateGameStatus()
    clock.incrementTurnNumber()
    printer.printFormattedBoardForConsole()
}