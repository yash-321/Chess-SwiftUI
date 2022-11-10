//
//  Queen.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation
import SwiftUI

class Queen: Piece {
    var colour: PieceColour
    var image: Image
    
    init(colour: PieceColour) {
        self.colour = colour
        image = colour == .Black ? Image("b-queen") : Image("w-queen")
    }
    
    func isLegitMove(from start: Position, to end: Position, on board: BoardState) -> Bool {
        return Rook(colour: colour).isLegitMove(from: start, to: end, on: board) || Bishop(colour: colour).isLegitMove(from: start, to: end, on: board)
    }
}
