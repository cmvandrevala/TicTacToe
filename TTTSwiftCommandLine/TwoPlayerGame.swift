public protocol TwoPlayerGame {
    
    init(playerOne: Player, playerTwo: Player)

    func play()
    func clear()
    
    func playerOne() -> Player
    func playerTwo() -> Player
    
    func changePlayerOne(player: Player)
    func changePlayerTwo(player: Player)
    
}
