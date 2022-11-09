//
//  King.swift
//  Chess
//
//  Created by Yash Sangha on 07/11/2022.
//

import Foundation
import SwiftUI

class King: Piece {
    var colour: PieceColour
    var image: Image
    
    init(colour: PieceColour) {
        self.colour = colour
        image = colour == .Black ? Image("b-king") : Image("w-king")
    }
    
    func isLegitMove(from start: Position, to end: Position) -> Bool {
        return true
    }
}
