//
//  Permission.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 16/07/23.
//

import Foundation

class Permession {
    func checkRightAndLeft(curLocationCopy: [Location], howMuch: Int, isSwipedRight: Bool, eachSwiped: Double) -> Bool {
        
        var nextBrickCor = curLocationCopy
        if isSwipedRight {
            for i in curLocationCopy.enumerated() {
                nextBrickCor[i.offset].currentX = i.element.currentX + CGFloat(howMuch)
            }
            
             for i in nextBrickCor {
                 if i.currentX > 270 {
                     return true
                 }
             }
        } else {
            for i in curLocationCopy.enumerated() {
                nextBrickCor[i.offset].currentX = i.element.currentX - CGFloat(howMuch)
            }
            
         for i in nextBrickCor {
             if i.currentX < 0 {
                 return true
             }
         }
          
        }
        
        //check added that are there exist some brick
        for points in BrickModel.addedLocations {
                if nextBrickCor.contains(points) {
                    TetrisVC.turnedX = eachSwiped
                    return true
            }
        }
                return false
    }
}


//func checkRightAndLeft(curLocationCopy: [Location], howMuch: Int, isSwipedRight: Bool, eachSwiped: Double) -> Bool {
//
//    var nextBrickCor = curLocationCopy
//    /// 'nextRightCor' - if we allow to move right to howMuch, cordinates will equal 'nextRightCor'
//
//    if isSwipedRight {
//        for i in curLocationCopy.enumerated() {
//            nextBrickCor[i.offset].currentX = i.element.currentX + CGFloat(howMuch)
//        }
//
//            ///` find maxX of nextRightCor
//         var maxX = nextBrickCor[0].currentX
//         for i in nextBrickCor {
//             if i.currentX > maxX {
//                 maxX = i.currentX
//             }
//         }
//
//         if maxX > 270 {
//             return true
//         }
//    } else {
//        for i in curLocationCopy.enumerated() {
//            nextBrickCor[i.offset].currentX = i.element.currentX - CGFloat(howMuch)
//        }
//
//        ///` find minX of nextRightCor
//     var minX = nextBrickCor[0].currentX
//     for i in nextBrickCor {
//         if i.currentX < minX {
//             minX = i.currentX
//         }
//     }
//
//     if minX < 0 {
//         return true
//     }
//
//    }
//
//    //check added that are there exist some brick
//    for points in BrickModel.addedLocations {
//            if nextBrickCor.contains(points) {
//                TetrisVC.turnedX = eachSwiped
//                return true
//        }
//    }
//            return false
//}
