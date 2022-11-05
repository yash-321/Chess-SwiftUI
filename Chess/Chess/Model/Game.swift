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
    
    init(from settings: GameSettings) {
        self.settings = settings
    }
}
