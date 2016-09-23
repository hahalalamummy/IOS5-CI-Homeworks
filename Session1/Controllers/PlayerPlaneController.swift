//
//  PlayerPlaneController.swift
//  Session1
//
//  Created by Apple on 9/22/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PlayerPlaneController : Controller {
    
    private let SHOT_DURATION = 0.5
    private var bulletView : View!
    private var isPowerUpOrNot = false
    
    override func setup(parent: SKNode) {
        addShotAction(parent)
        configurePhysics()
    }
    
    func configurePhysics() -> Void {
        self.view.physicsBody = SKPhysicsBody(rectangleOfSize: self.view.frame.size)
        
        self.view.physicsBody?.categoryBitMask = PHYSICS_MASK_PLAYER
        self.view.physicsBody?.collisionBitMask = 0
        self.view.physicsBody?.contactTestBitMask = PHYSICS_MASK_ENEMY_BULLET
        self.view.physicsBody?.contactTestBitMask = PHYSICS_MASK_ENEMY
        self.view.physicsBody?.contactTestBitMask = PHYSICS_MASK_POWER_UP
    }
    
    private func addShotAction(parent: SKNode) -> Void {
        self.view.runAction(
            SKAction.repeatActionForever(
                SKAction.sequence(
                    [
                        SKAction.runBlock { self.addBullet(parent) },
                        SKAction.waitForDuration(SHOT_DURATION)
                    ]
                )
            )
        )
    }
    
    private func addBullet(parent: SKNode) {
        if isPowerUpOrNot {
            bulletView = View(imageNamed: "bullet-double.png")
        }
        else {
            bulletView = View(imageNamed: "bullet.png")
        }
        
        // 2
        bulletView.position = view.position.add(
            CGPoint(x: 0, y: view.frame.height / 2 +
                bulletView.frame.height / 2 + 10)
        )
        
        // 3
        let bulletController = PlayerBulletController(view: bulletView)
        
        // 4
        bulletController.setup(parent) // ? ?
        
        // x
        parent.addChild(bulletView)
        
        //        // 4
        //        let bulletFly = SKAction.moveByX(0, y: 30, duration: 0.1)
        //
        //        // 5
        //        bullet.runAction(SKAction.repeatActionForever(bulletFly))
        //
        //        // 5
        //        bullet.name = "bullet"
    }
    
    func powerUp() {
        isPowerUpOrNot = true
    }
}
