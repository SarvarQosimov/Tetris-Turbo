//
//  BrickModel.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 12/05/23.
//

import Foundation

struct Location: Equatable {
    var currentX: CGFloat
    var currentY: CGFloat
}

enum type {
    case s, z, j, l, t, o, i
}

enum Position {
    case up, right, left, down
}

struct BrickModel {
    
    static var currentLocations = SBrick.beginningCordinates

    static var addedLocations = [Location(currentX: 0, currentY: 0)]
    static var typeOfBrick: type = .s
    static var position: Position = .down
    
}
