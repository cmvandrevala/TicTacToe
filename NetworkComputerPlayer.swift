import Foundation

open class NetworkComputerPlayer: Player {
    
    public init() {}
    
    public let urlString = "https://dry-wave-85958.herokuapp.com/api/get_move"
    public let boardKey = "board"
    
    public func getMove(board: Board) -> Int? {
        return nil;
    }
    
}
