//
//  GameSettings.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import Foundation
import SwiftUI

class GameSettings: ObservableObject {
    @Published var squareColour = Color.black
    
    var squareSize: CGFloat {
        UIScreen.main.bounds.width / 8
    }
}
