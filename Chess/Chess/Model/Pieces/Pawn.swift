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
    
    func isLegitMove(from start: Position, to end: Position) -> Bool {
        return true
    }
}
