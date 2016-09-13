func newGame() {
    let clock = GameClock()
    let board = Board()
    let rules = Rules(board: board)
    let retriever = UserInputRetriever(board: board)
    let printer = ConsoleBoard(board: board)
    
    print(printer.formattedBoardForConsole())
    
    while !rules.gameIsOver() {
        retriever.humanPlayersTurn(clock)
        rules.updateGameStatus()
        clock.incrementTurnNumber()
        print(printer.formattedBoardForConsole())
    }
}

let messages = ConsoleMessages()
var playerWantsToContinue = true

print(messages.welcomeMessage())

while playerWantsToContinue {
    var playerResponse = readLine()
    switch playerResponse! {
    case "1":
        newGame()
        print(messages.askToPlayAgain())
    case "Yes":
        newGame()
        print(messages.askToPlayAgain())
    case "2":
        playerWantsToContinue = false
        print(messages.leaveGameMessage())
    case "No":
        playerWantsToContinue = false
        print(messages.leaveGameMessage())
    default:
        print(messages.invalidInputMessage())
    }
}