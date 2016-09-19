public class Clock {
    
    var turnNumber = 1
    
    public init() {}
    
    public func incrementTurnNumber() {
        turnNumber += 1
    }
    
    public func playerOnesTurn() -> Bool {
        return turnNumber%2 == 1
    }
    
}