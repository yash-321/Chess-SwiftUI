//
//  Game.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import Foundation
import SwiftUI

class Game: ObservableObject {    
    // Game settings
    @Published var settings: GameSettings
    
    /// The game board
    @Published var boardState: BoardState
    
    private var turn: PieceColour {
        return boardState.turn
    }
    
    var selectedCell: Cell? = nil
    
    init(from settings: GameSettings) {
        self.settings = settings
        self.boardState = BoardState(turn: .White)
        self.boardState.initializePieces()
    }
    
    func click(on cell: Cell) {
        if cell == selectedCell {
            selectedCell = nil
        } else {
            if cell.piece?.colour == turn {
                selectedCell = cell
            }
        }
        self.objectWillChange.send()
    }
}
