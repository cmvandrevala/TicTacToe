var board = Board()
let rules = Rules(board: board)
var printer = BoardPrinter()

var currentTurn = 1

while !rules.gameIsOver() {
    print("Please enter your input [0-8]:")
    var response = Int(readLine(stripNewline: true)!)
    if currentTurn%2 == 1 {
        board.move(response!, cellStatus: .PlayerOne)
    } else {
        board.move(response!, cellStatus: .PlayerTwo)
    }
    rules.updateGameStatus()
    currentTurn += 1
    print(printer.formattedBoardForConsole(board))
}