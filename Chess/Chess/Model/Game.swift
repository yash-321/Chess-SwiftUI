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
    var potentialMoves = [Position]()
    
    init(from settings: GameSettings) {
        self.settings = settings
        self.boardState = BoardState(turn: .White)
        self.boardState.initializePieces()
    }
    
    func click(on cell: Cell) {
        if cell == selectedCell {
            selectedCell = nil
            potentialMoves = [Position]()
        } else {
            if cell.piece?.colour == turn {
                selectedCell = cell
                potentialMoves = boardState.getLegalMoves(for: cell)
            } else {
                if potentialMoves.contains(cell.position) {
                    if boardState.makeLegalMove(from: selectedCell!.position, to: cell.position) {
                        print("Game Over")
                        // TODO 
                    }
                    selectedCell = nil
                    potentialMoves = [Position]()
                }
            }
        }
        self.objectWillChange.send()
    }
}
