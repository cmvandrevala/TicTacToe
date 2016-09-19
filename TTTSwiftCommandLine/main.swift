func newGame() {
    let clock = Clock()
    let board = Board()
    let rules = Rules(board: board)
    let retriever = UserInputRetriever(board: board)
    let printer = ConsoleBoard(board: board)
    
    print(printer.formattedBoardForConsole())
    
    while !rules.isGameOver() {
        retriever.humanPlayersTurn(clock)
        rules.updateGameStatus()
        clock.incrementTurnNumber()
        print(printer.formattedBoardForConsole())
    }
}

let messages = ConsoleMessages()
let playerOne = HumanPlayer()

print(messages.welcomeMessage())

while playerOne.wantsToContinuePlaying {
    var playerResponse = readLine()
    switch playerResponse! {
    case "1":
        newGame()
        print(messages.askToPlayAgain())
    case "Yes":
        newGame()
        print(messages.askToPlayAgain())
    case "2":
        playerOne.noLongerWantsToPlay()
        print(messages.leaveGameMessage())
    case "No":
        playerOne.noLongerWantsToPlay()
        print(messages.leaveGameMessage())
    default:
        print(messages.invalidInputMessage())
    }
}