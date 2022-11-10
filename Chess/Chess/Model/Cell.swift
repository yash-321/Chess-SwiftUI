//
//  Cell.swift
//  Chess
//
//  Created by Yash Sangha on 02/11/2022.
//

import Foundation
import SwiftUI

class Cell: ObservableObject, Equatable {
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        return lhs.position == rhs.position
    }
    
    var position: Position
    
    @Published var piece: Piece?
    
    var isSelected: Bool
    
    init(row: Int, column: Int, piece: Piece?) {
        self.position = Position(row: row, col: column)
        self.piece = piece
        self.isSelected = false
    }
    
    // Get the image associated to the status of the cell
    var image: Image {
        piece?.getImage() ?? Image("")
    }
}
