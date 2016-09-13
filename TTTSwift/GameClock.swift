public class GameClock {
    
    var turnNumber = 1
    
    public init() {}
    
    public func currentTurnNumber() -> Int {
        return turnNumber
    }
    
    public func incrementTurnNumber() {
        turnNumber += 1
    }
    
    public func playerOnesTurn() -> Bool {
        return currentTurnNumber()%2 == 1
    }
    
}