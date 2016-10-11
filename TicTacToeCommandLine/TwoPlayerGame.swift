public protocol TwoPlayerGame {

    func play()
    func clear()
    func isInProgress() -> Bool

    var playCount: Int { get }
    var firstPlayerType: Player { get set }
    var secondPlayerType: Player { get set }
    
}
