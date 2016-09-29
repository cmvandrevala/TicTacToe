open class Clock {
    
    var turnNumber = 1
    
    public init() {}
    
    open func incrementTurnNumber() {
        turnNumber += 1
    }
    
    open func playerOnesTurn() -> Bool {
        return turnNumber%2 == 1
    }
    
    open func clear() {
        turnNumber = 1
    }
    
}
