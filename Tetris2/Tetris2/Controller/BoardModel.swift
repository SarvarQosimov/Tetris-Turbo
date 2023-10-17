//
//  BoardModel.swift
//  Tetris2
//
//  Created by Sarvar Qosimov on 13/05/23.
//

import Foundation

class Board {
   static var typeSorting = TypeSorting()
    static func isValidDown() -> Bool{
        var plusOneY = BrickModel.currentLocations
        
        for i in 0...3 {
            plusOneY[i].currentY += 30
        }
        
        for point in plusOneY {
            for points in BrickModel.addedLocations {
                if points == point {
                    return true
                }
            }
        }
        return false
    }
  
    //MARK: - isPermittedToNextPosition -
    static func isPermittedToNextPosition() -> (allowedToRight: Bool, allowedToLeft: Bool){
        
        var howMuchForRight: ([CGFloat],[CGFloat]) = ([],[])
        var howMuchForLeft: ([CGFloat],[CGFloat]) = ([],[])
        var isAllowedToRight = true
        var isAllowedToLeft = false
        
                    ///` change howMuch according to typeOfBrick
        
        howMuchForRight = Board.typeSorting.sortByType().0
        howMuchForLeft  = Board.typeSorting.sortByType().1
        
    //MARK:  if is valid at right , don't allow to make next position (right)
        
                ///` IN
        let nextPositionXForRight = TetrisVC.nextPositionX(
            cordinates: BrickModel.currentLocations,
            howMuch: howMuchForRight.0)
        
        let nextPositionYForRight = TetrisVC.nextPositionY(
            cordinates: nextPositionXForRight,
            howMuch: howMuchForRight.1)
        
         for i in nextPositionYForRight {
            if i.currentX > 240 {
                isAllowedToRight = false
                isAllowedToLeft = true
            }
        }
                ///` OUT
        
                ///` check added
        for i in nextPositionYForRight {
            for points in BrickModel.addedLocations {
                if points == i{
                    isAllowedToRight = false
                    isAllowedToLeft = true
                }
            }
        }

//MARK: - if is valid at left , don't allow to make next position (left) -
                ///` IN
        let nextPositionXForLeft = TetrisVC.nextPositionX(
            cordinates: BrickModel.currentLocations,
            howMuch: howMuchForLeft.0)
        
        let nextPositionYForLeft = TetrisVC.nextPositionY(
            cordinates: nextPositionXForLeft,
            howMuch: howMuchForLeft.1)
        
         for i in nextPositionYForLeft {
            if i.currentX < 0 {
                 isAllowedToLeft = false
            }
        }
                ///` OUT
        
                ///` check added
        for i in nextPositionYForLeft {
            for points in BrickModel.addedLocations {
                if points == i {
                    isAllowedToLeft = false
                }
            }
        }

        return (isAllowedToRight, isAllowedToLeft)
    }
    
}
