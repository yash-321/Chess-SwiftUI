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
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Chess")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 0) {
                    ForEach(0..<8, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<8, id: \.self) { col in
                                if (row + col).isMultiple(of: 2) {
                                    CellView(cell: game.boardState.getCell(row: row, col: col), colour: .black)
                                } else {
                                    CellView(cell: game.boardState.getCell(row: row, col: col), colour: .brown)
                                }
                                
                            }
                        }
                    }
                }
                Spacer()
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
