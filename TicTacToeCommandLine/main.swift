let board = Board()
let game = Game(board: board)
let inputReader = MainMenuInputReader()

MainMenu(userInputReader: inputReader).start(game: game)
