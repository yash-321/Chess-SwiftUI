//
//  ChessApp.swift
//  Chess
//
//  Created by Yash Sangha on 02/11/2022.
//

import SwiftUI

@main
struct ChessApp: App {
    var gameSettings = GameSettings()
    
    var body: some Scene {
        WindowGroup {
            BoardView()
                .environmentObject(Game(from: gameSettings))
        }
    }
}
