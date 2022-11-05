//
//  BoardView.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ForEach(0..<8, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<8, id: \.self) { col in
                            if (row + col).isMultiple(of: 2) {
                                CellView(cell: Cell(row: row, column: col, piece: Rook(colour: .Black)), colour: .black)
                            } else {
                                CellView(cell: Cell(row: row, column: col, piece: Rook(colour: .Black)), colour: .gray)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    private static var gameSettings = GameSettings()
        static var previews: some View {
            BoardView()
                .environmentObject(Game(from: gameSettings))
    }
}
