//
//  GameScene.swift
//  Sesstion1
//
//  Created by admin on 8/29/16.
//  Copyright (c) 2016 Linh. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var plane:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        //        /* Setup your scene here */
        print("Did move to view")
        self.addBackround()
        self.addPlane()
    }
    
    func addBackround() {
        let background = SKSpriteNode(imageNamed: "background.png")
        
        background.anchorPoint = CGPointZero
        background.position=CGPointZero
        
        addChild(background)
    }
    
    func addPlane() -> Void {
        plane = SKSpriteNode(imageNamed: "plane2.png")
        
        plane.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        
        addChild(plane)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("touchesBegan")
//        let touch = touches.first
//        let touchPosition=touch!.locationInView(self.view)
//        plane.position = CGPoint(x: touchPosition.x, y: self.frame.height-touchPosition.y)
        
        /* Called when a touch begins */
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesMoved")
        print("touches count: \(touches.count)")
        if let touch = touches.first{
            let currentTouch = touch.locationInNode(self)
            let previousTouch = touch.previousLocationInNode(self)
            
//            let dx = currentTouch.x - previousTouch.x
//            let dy = currentTouch.y - previousTouch.y
//            let movementVector = addCGPoint(currentTouch, p2: previousTouch)
         
//            let planeNewX = plane.position.x + movementVector.x
//            let planeNewY = plane.position.y + movementVector.y
            //plane.position = CGPoint(x: planeNewX, y: planeNewY)
            
            plane.position = currentTouch.substract(previousTouch).add(plane.position)
            
         
        }
        //print(touches.first)
        
    }
    
//    func addCGPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
//        let dx = p1.x - p2.x
//        let dy = p1.y - p2.y
//        return CGPoint(x: dx, y: dy)
//    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        print("current time: \(currentTime)")
    }
}
