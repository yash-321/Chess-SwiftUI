//
//  BoardState.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation
import SwiftUI

class BoardState {
    private var board: [[Cell]]
    public var turn: PieceColour
    
    init(turn: PieceColour) {
        self.board = Self.generateBoard()
        self.turn = turn
    }
    
    public func changeTurn() {
        turn = !turn
    }
    
    public func makeLegalMove(from start: Position, to end: Position) -> Bool {
        if !hasPiece(row: start.row, col: start.col) {
            //fatalError("No piece at given start position")
        }
        
        if getPiece(row: end.row, col: end.col)?.image == Image("b-king") || getPiece(row: end.row, col: end.col)?.image == Image("w-king") {
            print("Game Over")
            return true
        }
        
        let piece = getPiece(row: start.row, col: start.col)
        removePiece(row: start.row, col: start.col)
        setPiece(row: end.row, col: end.col, piece: piece!)
        changeTurn()
        return false
    }
    
    public func getPiece(row: Int, col: Int) -> Piece? {
        return board[row][col].piece
    }
    
    public func hasPiece(row: Int, col: Int) -> Bool {
        return board[row][col].piece != nil
    }
    
    public func getCell(row: Int, col: Int) -> Cell {
        return board[row][col]
    }
    
    public func setPiece(row: Int, col: Int, piece: Piece) {
        board[row][col].piece = piece
    }
    
    public func removePiece(row: Int, col: Int) {
        board[row][col].piece = nil
    }
    
    public func getLegalMoves(for cell: Cell) -> [Position] {
        var moves = [Position]()
        for i in 0..<8 {
            for j in 0..<8 {
                let move = Position(row: i, col: j)
                if (cell.piece?.isLegitMove(from: cell.position, to: move, on: self))! {
                    moves.append(move)
                }
            }
        }
        return moves
    }
    
    public func initializePieces() {
        self.setPiece(row: 0, col: 0, piece: Rook(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 1, piece: Knight(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 2, piece: Bishop(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 3, piece: Queen(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 4, piece: King(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 5, piece: Bishop(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 6, piece: Knight(colour: PieceColour.Black))
        self.setPiece(row: 0, col: 7, piece: Rook(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 0, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 1, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 2, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 3, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 4, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 5, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 6, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(row: 1, col: 7, piece: Pawn(colour: PieceColour.Black))

        //White pieces
        self.setPiece(row: 6, col: 0, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 1, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 2, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 3, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 4, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 5, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 6, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 6, col: 7, piece: Pawn(colour: PieceColour.White))
        self.setPiece(row: 7, col: 0, piece: Rook(colour: PieceColour.White))
        self.setPiece(row: 7, col: 1, piece: Knight(colour: PieceColour.White))
        self.setPiece(row: 7, col: 2, piece: Bishop(colour: PieceColour.White))
        self.setPiece(row: 7, col: 3, piece: Queen(colour: PieceColour.White))
        self.setPiece(row: 7, col: 4, piece: King(colour: PieceColour.White))
        self.setPiece(row: 7, col: 5, piece: Bishop(colour: PieceColour.White))
        self.setPiece(row: 7, col: 6, piece: Knight(colour: PieceColour.White))
        self.setPiece(row: 7, col: 7, piece: Rook(colour: PieceColour.White))

    }
    
    private static func generateBoard() -> [[Cell]] {
        var newBoard = [[Cell]]()

        // Create our board with cells
        for row in 0..<8 {
            var column = [Cell]()
            for col in 0..<8 {
                column.append(Cell(row: row, column: col, piece: nil))
            }
            newBoard.append(column)
        }

        return newBoard
    }
}
