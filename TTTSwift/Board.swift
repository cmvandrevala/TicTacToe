public class Board {
    
    public var marks: [Int?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    
    func move(player: Int, space: Int) {
        if marks[space - 1] == nil {
            marks[space - 1] = player
        }
    }
    
}