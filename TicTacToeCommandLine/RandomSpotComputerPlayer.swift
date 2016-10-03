import Foundation

open class RandomSpotComputerPlayer: Player {
    
    public init() {}
    
    open func getMove(board: Board) -> Int? {
        if board.isFilled() {
            return nil
        }
        while true {
            let testIndex = Int(arc4random_uniform(9))
            if board.isEmptyCellAtIndex(cellIndex: testIndex) {
                return testIndex
            }
        }
    }

}
