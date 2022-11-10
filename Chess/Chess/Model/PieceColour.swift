//
//  PieceColour.swift
//  Chess
//
//  Created by Yash Sangha on 03/11/2022.
//

import Foundation

enum PieceColour {
    case Black, White
}

prefix func !(a: PieceColour) -> PieceColour {
    return a == .Black ? .White : .Black
}
