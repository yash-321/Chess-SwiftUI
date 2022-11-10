//
//  Bishop.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation
import SwiftUI

class Bishop: Piece {
    var colour: PieceColour
    var image: Image
    
    init(colour: PieceColour) {
        self.colour = colour
        image = colour == .Black ? Image("b-bishop") : Image("w-bishop")
    }
    
    func isLegitMove(from start: Position, to end: Position, on board: BoardState) -> Bool {
        if(start.row == end.row || start.col == end.col){
            //Did not move diagonally
            print("Not valid move")
            return false
        }
        
        if(abs(end.row - start.row) != abs(end.col - start.col)){
            print("Not valid move")
            return false
        }

        if (board.hasPiece(row: end.row, col: end.col)){
            if (board.getPiece(row: end.row, col: end.col)?.getColour() == board.getPiece(row: start.row, col: start.col)?.getColour()){
                print("One of your pieces is on that space")
                return false
            }
        }
        
        var rowOffset: Int
        var colOffset: Int
        
        if(start.row < end.row){
            rowOffset = 1
        }else{
            rowOffset = -1
        }
        
        if(start.col < end.col){
            colOffset = 1
        }else{
            colOffset = -1
        }
        
        var y = start.col + colOffset
        var x = start.row + rowOffset
        while x != end.row {
            
            if(board.hasPiece(row: x, col: y)){
                print("There is a piece in the way")
                return false
            }
            x += rowOffset
            y += colOffset
        }
        
        print("Valid Move")
        return true

    }
}
