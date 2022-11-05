//
//  Cell.swift
//  Chess
//
//  Created by Yash Sangha on 02/11/2022.
//

import Foundation
import SwiftUI

class Cell: ObservableObject {
    var row: Int
    var column: Int
    
    @Published var piece: Piece?
    
    init(row: Int, column: Int, piece: Piece?) {
        self.row = row
        self.column = column
        self.piece = piece
    }
    
    // Get the image associated to the status of the cell
    var image: Image {
        piece?.getImage() ?? Image("")
    }
}
