//
//  LBrick.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 19/05/23.
//

import Foundation

class LBrick {
    
   static var beginingCordinates = [
        Location(currentX: 180, currentY: 0),
        Location(currentX: 120, currentY: 30),
        Location(currentX: 150, currentY: 30),
        Location(currentX: 180, currentY: 30),
    ]
    
    static func resetCordinatesToRight() -> ([CGFloat],[CGFloat]){
        switch BrickModel.position {
        case .down:
            return ([-30,0,-30,-60],[30,-60,-30,0])
        case .right:
            return ([-30,60,30,0],[0,30,0,-30])
        case .up:
            return ([0,-30,0,30],[-60,30,0,-30])
        case .left:
            return ([60,-30,0,30],[30,0,30,60])
        }
    }
    
    static func resetCordinatesToLeft() -> ([CGFloat], [CGFloat]){
        switch BrickModel.position {
        case .down:
            return  ([0,30,0,-30],[30,-60,-30,0])
        case .right:
            return ([-60,30,0,-30],[0,30,0,-30])
        case .up:
            return ([30,0,30,60],[-60,30,0,-30])
        case .left:
            return ([30,-60,-30,0],[30,0,30,60])
        }
    }
    
}
