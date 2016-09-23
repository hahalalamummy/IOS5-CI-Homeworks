//
//  EnemyBulletController.swift
//  Session1
//
//  Created by admin on 9/23/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class EnemyBulletController: Controller {
    private let SPEED : Double = 1000
    
    override func setup(parent: SKNode) -> Void {
        addFlyAction(parent)
        configurePhysics()
    }
    
    func configurePhysics() -> Void {
        self.view.physicsBody = SKPhysicsBody(rectangleOfSize: self.view.frame.size)
        
        self.view.physicsBody?.categoryBitMask = PHYSICS_MASK_ENEMY_BULLET
        self.view.physicsBody?.collisionBitMask = 0
        self.view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER
    }
    
    // TODO
    func addFlyAction(parent: SKNode) -> Void {
        // 1
        let distanceToBottom = Double(parent.frame.height - self.view.frame.height)
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

}
