//
//  CGPointUtility.swift
//  Sesstion1
//
//  Created by admin on 9/4/16.
//  Copyright © 2016 Linh. All rights reserved.
//

import Foundation
import SpriteKit

extension CGPoint{
    func add(other : CGPoint) -> CGPoint {
        // 1 position
        let retX = self.x + other.x
        let retY = self.y + other.y
        
        // 2 screen size
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        // 3 check position with screen size
        if(retX>=screenWidth*0 && retX<=screenWidth)
        {
            if(retY>=screenHeight*0 && retY<=screenHeight)
            {
                return CGPoint(x: retX, y: retY)
            }
                
            else
            {
                if(retY<screenHeight*0)
                {
                    return CGPoint(x: retX, y: screenHeight*0)
                }
                else // retY > screenHeight
                {
                    return CGPoint(x: retX, y: screenHeight)
                }
            }
        }
        else
        {
            if(retX<screenWidth*0)
            {
                if(retY>=0 && retY<=screenHeight)
                {
                    return CGPoint(x: screenWidth*0, y: retY)
                }
                    
                else
                {
                    if(retY<0)
                    {
                        return CGPoint(x: screenWidth*0, y: screenHeight*0)
                    }
                    else // retY > screenHeight
                    {
                        return CGPoint(x: screenWidth*0, y: screenHeight)
                    }
                }
            }
            else // retX > screenWidth
            {
                if(retY>=screenHeight*0 && retY<=screenHeight)
                {
                    return CGPoint(x: screenWidth, y: retY)
                }
                    
                else
                {
                    if(retY<screenHeight*0)
                    {
                        return CGPoint(x: screenWidth, y: screenHeight*0)
                    }
                    else // retY > screenHeight
                    {
                        return CGPoint(x: screenWidth, y: screenHeight)
                    }
                }
            }
        }
    }
    func substract(other : CGPoint) -> CGPoint {
        return CGPoint(x: self.x - other.x, y: self.y - other.y)
    }
    
    func multiply(other: CGPoint) -> CGPoint {
        return CGPoint(x: self.x * other.x, y: self.y * other.y)
    }
    
    func distance(other: CGPoint) -> Double {
        return sqrt(pow(Double(self.x - other.x), 2) + pow(Double(self.y - other.y), 2))
    }
    
    func normalize() -> CGPoint{
        return CGPoint(x: Double(self.x) / distance(CGPointZero), y: Double(self.y) / distance(CGPointZero))
    }
}