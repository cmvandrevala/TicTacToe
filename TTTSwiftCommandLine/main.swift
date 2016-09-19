let messages = ConsoleMessages()
let playerOne = HumanPlayer()
let playerTwo = HumanPlayer()

print(messages.welcomeMessage())

while playerOne.wantsToContinuePlaying {
    var playerResponse = readLine()
    switch playerResponse! {
    case "1":
        let game = Game(playerOne: playerOne, playerTwo: playerTwo)
        game.play()
        print(messages.askToPlayAgain())
    case "Yes":
        let game = Game(playerOne: playerOne, playerTwo: playerTwo)
        game.play()
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
