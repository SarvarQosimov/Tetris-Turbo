//
//  TetrisViewModel.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 29/07/23.
//

import Foundation

class TetrisViewModel {
    
    //MARK: moveRightOrLeft
    func moveRightOrLeft(curLocationCopy: [Location], howMuch: Int, _ isSwipedRight: Bool) {
         if isSwipedRight {
            for i in curLocationCopy.enumerated() {
                BrickModel.currentLocations[i.offset].currentX = i.element.currentX + CGFloat(howMuch)
            }
        } else {
            for i in curLocationCopy.enumerated() {
                BrickModel.currentLocations[i.offset].currentX = i.element.currentX - CGFloat(howMuch)
            }
        }
    }
    
    //MARK: isAllowedMoveToDown
    func isAllowedMoveToDown() -> Bool {
        for i in 0...3 {
            if BrickModel.currentLocations[i].currentY+30 > 570 {
                return false
            }
        }
        return true
    }
    
}
