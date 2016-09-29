public protocol TwoPlayerGame {

    func play(_ playerOne: Player, playerTwo: Player)
    func clear()
    
    func playerOne() -> Player
    func playerTwo() -> Player
    
}
