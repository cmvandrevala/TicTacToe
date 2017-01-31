open class BoardPatterns {

    public init() {}

    open func groupsOfThreeCells() -> [[Int]] {
        return rows() + columns() + diagonals()
    }

    fileprivate func rows() -> [[Int]] {
        return [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
    }

    fileprivate func columns() -> [[Int]] {
        return [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
    }

    fileprivate func diagonals() -> [[Int]] {
        return [ [0, 4, 8], [2, 4, 6] ]
    }


}
