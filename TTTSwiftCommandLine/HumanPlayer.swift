public class HumanPlayer {
    
    public var wantsToContinuePlaying: Bool = true
    
    public init() {}
    
    public func noLongerWantsToPlay() {
        wantsToContinuePlaying = !wantsToContinuePlaying
    }
    
    
}