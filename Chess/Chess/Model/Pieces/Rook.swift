//
//  Rook.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import Foundation
import SwiftUI

class Rook: Piece {
    
    var colour: PieceColour
    var image: Image
    
    init(colour: PieceColour) {
        self.colour = colour
        image = colour == .Black ? Image("b-rook") : Image("w-rook")
    }
    
    func isLegitMove(from start: Position, to end: Position, on board: BoardState) -> Bool {
        if(start.row != end.row && start.col != end.col){
            //Did not move along one rank/file
            print("Invalid move")
            return false;
        }
        
        //First I will assumed the Rook is moving along the rows.
        var offset: Int
        
        if (start.row != end.row){
            if (start.row < end.row){
                offset = 1;
            } else {
                offset = -1;
            }
            
            var x = start.row + offset
            while x != end.row {
                //Go from current row to new row, and check every space
                if (board.hasPiece(row: x, col: start.col)){
                    print("Piece in the way")
                    return false;
                }
                x += offset
            }
        }

        //Now do the same for columns
        if (start.col != end.col) {
            if (start.col < end.col) {
                offset = 1
            } else {
                offset = -1
            }
            
            var y = start.col + offset
            while y != end.col {
                //Go from current row to new row, and check every space
                if (board.hasPiece(row: start.row, col: y)){
                    print("Piece in the way")
                    return false;
                }
                y += offset
            }
        }

        if (board.hasPiece(row: end.row, col: end.col)){
            if (colour == board.getPiece(row: end.row, col: end.col)?.getColour()){
                print("Can't attack your own piece")
                return false
            }
        }
        
        return true
    }
}
