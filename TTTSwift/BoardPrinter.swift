//
//  BoardPrinter.swift
//  TTTSwift
//
//  Created by Cyrus Vandrevala on 9/8/16.
//  Copyright © 2016 Cyrus Vandrevala. All rights reserved.
//

public class BoardPrinter {
    
    public init() {}
    
    public func formattedBoardForConsole(board: Board) -> String {
        var formattedString = ""
        let paddedMarks = board.forEachMarkByRow(padMark)
        for (index, row) in paddedMarks.enumerate() {
            formattedString = addRowOfMarks(formattedString, row: row)
            if haveNotReachedLastRowOfBoard(index) {
                formattedString = addHorizontalLine(formattedString)
            }
        }
        return formattedString
    }
    
    private func haveNotReachedLastRowOfBoard(index: Int) -> Bool {
        return index < 2
    }
    
    private func addRowOfMarks(formattedString: String, row: [String]) -> String{
        let formattedRow = "\(row[0])|\(row[1])|\(row[2])"
        return "\(formattedString)\(formattedRow)"
    }
    
    private func addHorizontalLine(formattedString: String) -> String {
        let horizontalLine = "\n===========\n"
        return "\(formattedString)\(horizontalLine)"
    }
    
    private func padMark(mark: String) -> String {
        if mark == "" {
            return "   "
        } else {
            return " \(mark) "
        }
    }

    
}