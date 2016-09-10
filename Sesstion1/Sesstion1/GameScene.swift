//
//  GameScene.swift
//  Sesstion1
//
//  Created by admin on 8/29/16.
//  Copyright (c) 2016 Linh. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Nodes
    
    var bullets :[SKSpriteNode] = []
    var enemies : [SKSpriteNode] = []
    var plane:SKSpriteNode!
    
    //
    var lastUpdateTime : NSTimeInterval = -1
    
    // Count
    //var count = 0
    var bulletIntervalCount = 0
    var enemyIntervalCount = 0
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        print("Did move to view")
        self.addBackground()
        self.addPlane()
        self.addEnemy()
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
            
            plane.position = currentTouch.substract(previousTouch).add(plane.position)
            
            //            let dx = currentTouch.x - previousTouch.x
            //            let dy = currentTouch.y - previousTouch.y
            //            let movementVector = addCGPoint(currentTouch, p2: previousTouch)
            
            //            let planeNewX = plane.position.x + movementVector.x
            //            let planeNewY = plane.position.y + movementVector.y
            //plane.position = CGPoint(x: planeNewX, y: planeNewY)
        }
        //print(touches.first)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        print("current time: \(currentTime)")
        
//        if lastUpdateTime == -1{
//            lastUpdateTime = currentTime
//        } else {
//            let deltaTime = currentTime - lastUpdateTime
//            let deltaTimeInMilisecond = deltaTime * 1000
//            if deltaTimeInMilisecond > 100 { // fix enemy period speed here
//                self.enemyIntervalCount += 1
//                if self.enemyIntervalCount > 6 {
//                    self.enemyIntervalCount = 0
//                    addEnemy()
//                }
////                count+=1
////                if count==1{
////                    bulletIntervalCount = 0
////                    addBullet()
////                    addEnemy()
////                    lastTimeUpdate = currentTime
////                }
////                count=0
//                lastUpdateTime = currentTime
//            }
//        }
        
        for (bulletIndex, bullet) in bullets.enumerate(){
            for (enemyIndex, enemy) in enemies.enumerate(){
                // 1
                let bulletFrame = bullet.frame
                let enemyFrame = enemy.frame
                // 2
                if CGRectIntersectsRect(bulletFrame, enemyFrame){
                    //3
                    bullet.removeFromParent()
                    enemy.removeFromParent()
                    
                    //4
                    bullets.removeAtIndex(bulletIndex)
                    enemies.removeAtIndex(enemyIndex)
                }
            }
            
//            for bullet in bullets{
//                bullet.position.y += 20
//            }

//            for enemy in enemies{
//                //enemy.position.x += 10
//                enemy.position.y -= 1
//            }
        }
//        for (bulletIndex, bullet) in bullets.enumerate(){
//            let screenSize: CGRect = UIScreen.mainScreen().bounds
//            let screenHeight = screenSize.height
//            if bullet.position.y > screenHeight{
//                bullets.removeAtIndex(bulletIndex)
//            }
//        }
//        for (enemyIndex, enemy) in enemies.enumerate(){
//            let screenSize: CGRect = UIScreen.mainScreen().bounds
//            let screenHeight = screenSize.height
//            if enemy.position.y < 0{
//                enemies.removeAtIndex(enemyIndex)
//            }
//        }
    }
    
    func addEnemy() {
        print("add enemy")
        let enemyAppear = SKAction.runBlock{
            // 1
            let enemy = SKSpriteNode(imageNamed: "enemy_plane_white_1.png")
            
            // 2
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            //let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            enemy.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(self.frame.maxX))), y: screenHeight)
            
            // 3
            self.addChild(enemy)
            
            // 4
            let enemyFly = SKAction.moveByX(0, y: -20, duration: 0.1)
            
            // 5
            enemy.runAction(SKAction.repeatActionForever(enemyFly))
            
            // 6
            self.enemies.append(enemy)
        }
        let periodEnemy = SKAction.sequence([enemyAppear, SKAction.waitForDuration(2)])
        self.runAction(SKAction.repeatActionForever(periodEnemy))
    }
    
    func addPlane() -> Void {
        // 1
        plane = SKSpriteNode(imageNamed: "plane2.png")
        
        // 2
        plane.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        
        // 3
        let shot = SKAction.runBlock {
            self.addBullet()
        }
        let periodShot = SKAction.sequence([shot, SKAction.waitForDuration(0.5)])
        let shotForever = SKAction.repeatActionForever(periodShot)
        
        // 4
        plane.runAction(shotForever)
        
        // 5
        addChild(plane)
    }
    
    func addBullet() {
        // 1
        let bullet = SKSpriteNode(imageNamed: "bullet.png")
        
        // 2
        bullet.position = plane.position
        bullet.position.y += 50
        
        // 3
        addChild(bullet)
        
        //4
        let bulletFly = SKAction.moveByX(0, y: 30, duration: 0.1)
        
        //5
        bullet.runAction(SKAction.repeatActionForever(bulletFly))
        
        // 6
        bullets.append(bullet)
    }
    
    
    //    func addCGPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
    //        let dx = p1.x - p2.x
    //        let dy = p1.y - p2.y
    //        return CGPoint(x: dx, y: dy)
    //    }
    
    func addBackground() {
        // 1
        let background = SKSpriteNode(imageNamed: "background.png")
        
        // 2
        background.anchorPoint = CGPointZero
        background.position=CGPointZero
        
        // 3
        addChild(background)
    }
    
}
