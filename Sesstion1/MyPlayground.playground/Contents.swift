//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension CGPoint{
    func substract(other : CGPoint) -> CGPoint {
        return CGPoint(x: self.x - other.x, y: self.y - other.y)
    }
    
    func multiply(other: CGFloat) -> CGPoint {
        return CGPoint(x: self.x * other, y: self.y * other)
    }
    
    func distance(other: CGPoint) -> Double {
        return sqrt(pow(Double(self.x - other.x), 2) + pow(Double(self.y - other.y), 2))
    }
    
    func normalize() -> CGPoint{
        return CGPoint(x: Double(self.x) / distance(CGPointZero), y: Double(self.y) / distance(CGPointZero))
    }
}

let a1 = CGPoint(x: 3, y: 4)
let a2 = CGPoint(x: 5, y: 6)

a1.multiply(3)
a1.distance(a2)
a1.normalize()