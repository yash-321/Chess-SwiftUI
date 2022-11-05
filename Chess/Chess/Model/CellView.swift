//
//  CellView.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import SwiftUI

struct CellView: View {
    @EnvironmentObject var game: Game
    let cell: Cell
    let colour: Color
    
    var body: some View {
        VStack {
            cell.image
                .resizable()
                .scaledToFill()
                .padding(8)
        }
            .frame(width: game.settings.squareSize,
                    height: game.settings.squareSize,
                    alignment: .center)
            .background(colour)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(row: 0, column: 0, piece: Rook(colour: .Black)), colour: .blue)
            .environmentObject(Game(from: GameSettings()))
    }
}
