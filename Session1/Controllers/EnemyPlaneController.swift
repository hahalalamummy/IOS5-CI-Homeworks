//
//  EnemyPlaneController.swift
//  Session1
//
//  Created by Apple on 9/22/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class EnemyPlaneControler: Controller {
    
    private let SPEED : Double = 100
    
    override func setup(parent: SKNode) {
        addFlyAction(parent)
        configurePhysics()
        addShotAction(parent)
    }
    
    func configurePhysics() -> Void {
        // 1
        view.physicsBody = SKPhysicsBody(rectangleOfSize: view.frame.size)
        
        // 2
        view.physicsBody?.categoryBitMask = PHYSICS_MASK_ENEMY
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER_BULLET
        view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER
    }
    
    // TODO
    func addFlyAction(parent: SKNode) -> Void {
        // 1
        let distanceToBottom = Double(self.view.position.y)
        // 2
        let timeToReachBottom = distanceToBottom / SPEED
        
        // 3
        self.view.runAction(
            SKAction.sequence([
                SKAction.moveToY(0, duration: timeToReachBottom),
                SKAction.removeFromParent()
                ])
        )
    }
    
    private func addShotAction(parent: SKNode) -> Void {
        self.view.runAction(
            SKAction.repeatActionForever(
                SKAction.sequence(
                    [
                        SKAction.runBlock { self.addBullet(parent) },
                        SKAction.waitForDuration(0.5)
                    ]
                )
            )
        )
    }
    
    private func addBullet(parent: SKNode) {
        // 1
        let bulletView = View(imageNamed: "bullet.png")
        
        // 2
        bulletView.position = view.position.add(
            CGPoint(x: 0, y: view.frame.height / 2 -
                bulletView.frame.height / 2 - 50)
        )
        
        // 3
        let bulletController = EnemyBulletController(view: bulletView)
        
        // 4
        bulletController.setup(parent) // ? ?
        
        // x
        parent.addChild(bulletView)
        bulletView.name = "enemyBullet"
        
    }
}
