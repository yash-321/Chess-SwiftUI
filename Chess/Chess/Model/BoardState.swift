//
//  BoardState.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation


class BoardState {
    private var board: [[Cell]]
    public var turn: PieceColour
    
    init(turn: PieceColour) {
        self.board = Self.generateBoard()
        self.turn = turn
    }
    
    public func getCell(x: Int, y: Int) -> Cell {
        return board[x][y]
    }
    
    public func setPiece(x: Int, y: Int, piece: Piece) {
        board[x][y].piece = piece
    }
    
    public func initializePieces() {
        self.setPiece(x: 0, y: 0, piece: Rook(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 1, piece: Knight(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 2, piece: Bishop(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 3, piece: Queen(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 4, piece: King(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 5, piece: Bishop(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 6, piece: Knight(colour: PieceColour.Black))
        self.setPiece(x: 0, y: 7, piece: Rook(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 0, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 1, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 2, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 3, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 4, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 5, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 6, piece: Pawn(colour: PieceColour.Black))
        self.setPiece(x: 1, y: 7, piece: Pawn(colour: PieceColour.Black))

        //White pieces
        self.setPiece(x: 6, y: 0, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 1, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 2, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 3, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 4, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 5, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 6, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 6, y: 7, piece: Pawn(colour: PieceColour.White))
        self.setPiece(x: 7, y: 0, piece: Rook(colour: PieceColour.White))
        self.setPiece(x: 7, y: 1, piece: Knight(colour: PieceColour.White))
        self.setPiece(x: 7, y: 2, piece: Bishop(colour: PieceColour.White))
        self.setPiece(x: 7, y: 3, piece: Queen(colour: PieceColour.White))
        self.setPiece(x: 7, y: 4, piece: King(colour: PieceColour.White))
        self.setPiece(x: 7, y: 5, piece: Bishop(colour: PieceColour.White))
        self.setPiece(x: 7, y: 6, piece: Knight(colour: PieceColour.White))
        self.setPiece(x: 7, y: 7, piece: Rook(colour: PieceColour.White))

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
