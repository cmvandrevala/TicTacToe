var board = Board()
let rules = Rules()
var printer = BoardPrinter()

var players = ["X", "O"]

while !rules.gameIsOver(board) {
    var currentPlayer = players[0]
    print("Please enter your input [0-8]:")
    var response = Int(readLine(stripNewline: true)!)
    board.move(response!, player: currentPlayer)
    players = [players[1], players[0]]
    print(printer.formattedBoardForConsole(board))
}