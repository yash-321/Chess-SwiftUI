//
//  Pawn.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation
import SwiftUI

class Pawn: Piece {
    var colour: PieceColour
    var image: Image
    
    init(colour: PieceColour) {
        self.colour = colour
        image = colour == .Black ? Image("b-pawn") : Image("w-pawn")
    }
    
    func isLegitMove(from start: Position, to end: Position, on board: BoardState) -> Bool {
        if(start.row == end.row && start.col == end.col){
            print("Please choose a new space to move to")
            return false
        }

        if(colour == PieceColour.White){
            if(start.row < end.row){
                print("Can't move backwards")
                return false
            }
        }else{
            if(end.row < start.row){
                print("Can't move backwards")
                return false
            }
        }

        if(start.col == end.col){
            //Not taking a piece
            if(colour == PieceColour.White){
                if(board.hasPiece(row: start.row - 1, col: start.col)){
                    print("Can't attack piece in front")
                    return false
                }
            }else{
                if(board.hasPiece(row: start.row + 1, col: start.col)){
                    print("Can't attack piece in front")
                    return false
                }
            }

            if(abs(end.row - start.row) > 2){
                print("Invalid move")
                return false
            }else if(abs(end.row - start.row) == 2){
                //Advancing two spaces at beginning
                if (colour == PieceColour.White && start.row != 6) {
                    print("Can't move two if already moved")
                    return false
                }

                if(colour == PieceColour.Black && start.row != 1) {
                    print("Can't move two if already moved")
                    return false
                }

                if(colour == PieceColour.White){
                    if(board.hasPiece(row: start.row - 2, col: start.col)){
                        print("Can't attack piece in front")
                        return false
                    }
                }else{
                    if(board.hasPiece(row: start.row + 2, col: start.col)){
                        print("Can't attack piece in front")
                        return false
                    }
                }

            }
        }else{
            //Taking a piece
            if(abs(end.col - start.col) != 1 || abs(end.row - start.row) != 1){
                print("Not valid move")
                return false
            }

            if(!board.hasPiece(row: end.row, col: end.col)){
                print("No piece to attack on that space")
                return false
            }
            else{
                if(colour == board.getPiece(row: end.row, col: end.col)?.getColour()){
                    print("Can't attack your own piece")
                    return false
                }
            }
        }

        return true
    }
}
