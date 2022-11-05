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
    
    func isLegitMove(from start: Position, to end: Position) -> Bool {
        return true
    }
    
}
