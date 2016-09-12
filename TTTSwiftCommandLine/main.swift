var board = Board()
let rules = Rules()
var printer = BoardPrinter()

var currentTurn = 1

while !rules.gameIsOver(board) {
    print("Please enter your input [0-8]:")
    var response = Int(readLine(stripNewline: true)!)
    if currentTurn%2 == 1 {
        board.move(response!, cellStatus: .PlayerOne)
    } else {
        board.move(response!, cellStatus: .PlayerTwo)
    }
    currentTurn += 1
    print(printer.formattedBoardForConsole(board))
}