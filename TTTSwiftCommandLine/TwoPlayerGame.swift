public protocol TwoPlayerGame {

    func play(playerOne: Player, playerTwo: Player)
    func clear()
    
    func playerOne() -> Player
    func playerTwo() -> Player
    
}
