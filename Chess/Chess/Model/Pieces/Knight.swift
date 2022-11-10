//
//  Knight.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation
import SwiftUI

class Knight: Piece {
    var colour: PieceColour
    var image: Image
    
    init(colour: PieceColour) {
        self.colour = colour
        image = colour == .Black ? Image("b-knight") : Image("w-knight")
    }
    
    func isLegitMove(from start: Position, to end: Position, on board: BoardState) -> Bool {
        if ((end.row == (start.row+2) && (end.col == start.col+1 || end.col == start.col-1))||(end.row == (start.row-2) && (end.col == start.col+1 || end.col == start.col-1))||(end.col == (start.col+2) && (end.row == start.row+1 || end.row == start.row-1))||(end.col == (start.col-2) && (end.row == start.row+1 || end.row == start.row-1))){
            if (!board.hasPiece(row: end.row, col: end.col)){
                print("Move to empty space valid")
                return true
            }
            else{
                if (board.getPiece(row: end.row, col: end.col)?.getColour() == board.getPiece(row: start.row, col: start.col)?.getColour()){
                    print("One of your pieces is on that space")
                    return false
                }
                else{
                    print("Move to space with opposition piece valid")
                    return true
                }
            }
        }
        else{
            print("Not valid movement")
            return false
        }

    }
}
