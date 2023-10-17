//
//  IBrick.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 20/05/23.
//

import Foundation

class IBrick {
    static var beginingCordinates = [
        Location(currentX: 120, currentY: 60),
        Location(currentX: 150, currentY: 60),
        Location(currentX: 180, currentY: 60),
        Location(currentX: 210, currentY: 60)
    ]
    
    
        static func resetCordinatesToRight() -> ([CGFloat], [CGFloat]){
            switch BrickModel.position {
            case .down:
                return  ([0,-30,-60,-90],[-90,-60,-30,0])
            case .right:
                return ([90,60,30,0],[90,60,30,0])
            case .up:
                return  ([-90,-60,-30,0],[0,-30,-60,-90])
            case .left:
                return ([0,30,60,90],[0,30,60,90])
            }
        }
    
        static func resetCordinatesToLeft() -> ([CGFloat], [CGFloat]){
            switch BrickModel.position {
            case .down:
                return  ([90,60,30,0],[-90,-60,-30,0])
            case .right:
                return ([0,-30,-60,-90],[90,60,30,0])
            case .up:
                return  ([0,30,60,90],[0,-30,-60,-90])
            case .left:
                return ([-90,-60,-30,0],[0,30,60,90])
            }
        }
}
