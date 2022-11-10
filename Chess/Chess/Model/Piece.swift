//
//  Piece.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import Foundation
import SwiftUI

protocol Piece {
    var colour: PieceColour { get set }
    var image: Image { get set }
    
    func isLegitMove(from start: Position, to end: Position, on board: BoardState) -> Bool
}

extension Piece {
    func getImage() -> Image {
        return image
    }
    
    mutating func setImage(to image: Image) {
        self.image = image
    }
    
    func getColour() -> PieceColour {
        return colour
    }
}
