import Foundation

open class RandomSpotComputerPlayer: Player {
    
    public init() {}
    
    open func getMove(_ board: Board) -> Int? {
        if board.isFilled() {
            return nil
        }
        while true {
            let testIndex = Int(arc4random_uniform(9))
            if board.isEmptyCellAtIndex(testIndex) {
                return testIndex
            }
        }
    }

}
