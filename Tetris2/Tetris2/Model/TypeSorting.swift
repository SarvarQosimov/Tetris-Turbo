//
//  TypeSorting.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 16/07/23.
//

import Foundation

class TypeSorting {
    var howMuchForRight: ([CGFloat],[CGFloat]) = ([], [])
    var howMuchForLeft: ([CGFloat],[CGFloat]) = ([], [])
    var beginingCor: [Location] = []
    var beginingType: type = .i
    var nextViewCordinates: ([Double], [Double]) = ([], [])
    
    func sortByType() -> (
        ([CGFloat], [CGFloat]),
        ([CGFloat], [CGFloat]),
        [Location],
        type,
        ([Double], [Double])
    ) {
        switch BrickModel.typeOfBrick {
        case .s:
            howMuchForRight = SBrick.resetCordinatesToRight()
            howMuchForLeft = SBrick.resetCordinatesToLeft()
            
            beginingCor = ZBrick.beginningCordinates
            beginingType = .z
            
            nextViewCordinates.0 = [5,15,15,25]
            nextViewCordinates.1 = [20,20,30,30]
        case .z:
            howMuchForRight = ZBrick.resetCordinatesToRight()
            howMuchForLeft = ZBrick.resetCordinatesToLeft()
            
            beginingCor = JBrick.beginingCordinates
            beginingType = .j
            
            nextViewCordinates.0 = [20,20,20,10]
            nextViewCordinates.1 = [15,25,35,35]
        case .j:
            howMuchForRight = JBrick.resetCordinatesToRight()
            howMuchForLeft = JBrick.resetCordinatesToLeft()
            
            beginingCor = LBrick.beginingCordinates
            beginingType = .l
            
            nextViewCordinates.0 = [10,10,10,20]
            nextViewCordinates.1 = [15,25,35,35]
        case .l:
            howMuchForRight = LBrick.resetCordinatesToRight()
            howMuchForLeft = LBrick.resetCordinatesToLeft()
            
            beginingCor = TBrick.beginingCordinates
            beginingType = .t
            
            nextViewCordinates.0 = [5,15,25,15]
            nextViewCordinates.1 = [20,20,20,30]
        case .t:
            howMuchForRight = TBrick.resetCordinatesToRight()
            howMuchForLeft = TBrick.resetCordinatesToLeft()
            
            beginingCor = OBrick.beginingCordinates
            beginingType = .o
            
            nextViewCordinates.0 = [10,20,10,20]
            nextViewCordinates.1 = [20,20,30,30]
        case .o:
            print("o")
            
            howMuchForRight = ([0,0,0,], [0,0,0,0])
            howMuchForLeft = ([0,0,0,], [0,0,0,0])
            
            beginingCor = IBrick.beginingCordinates
            beginingType = .i
            
            nextViewCordinates.0 = [15,15,15,15]
            nextViewCordinates.1 = [10,20,30,40]
        case .i:
            howMuchForRight = IBrick.resetCordinatesToRight()
            howMuchForLeft = IBrick.resetCordinatesToLeft()
            
            beginingCor = SBrick.beginningCordinates
            beginingType = .s
            
            nextViewCordinates.0 = [25,15,15,5]
            nextViewCordinates.1 = [20,20,30,30]
        }
        
        return (
            howMuchForRight,
            howMuchForLeft,
            beginingCor,
            beginingType,
            nextViewCordinates
        )
        
    }
}
