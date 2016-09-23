//
//  PowerUpController.swift
//  Session1
//
//  Created by admin on 9/23/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PowerUpController: Controller {
    override func setup(parent: SKNode) -> Void {
        addFlyAction(parent)
        configurePhysics()
    }
    
    func configurePhysics() -> Void {
        self.view.physicsBody = SKPhysicsBody(rectangleOfSize: self.view.frame.size)
        
        self.view.physicsBody?.categoryBitMask = PHYSICS_MASK_POWER_UP
        self.view.physicsBody?.collisionBitMask = 0
        self.view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER
    }
    
    func addFlyAction(parent: SKNode) -> Void {
        self.view.runAction(
            SKAction.sequence([
                SKAction.waitForDuration(1),
                SKAction.moveToY(-30, duration: 5)
                ])
        )
    }
}
