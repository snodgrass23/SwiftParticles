//
//  GameScene.swift
//  SpriteKitParticles
//
//  Created by Jim Snodgrass on 6/11/14.
//  Copyright (c) 2014 Jim Snodgrass. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var particlesBuilt = false
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        if !particlesBuilt {
            buildParticles()
        }
        println(size)
        println(frame.width)
        println(CGRectGetMidX(frame))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func buildParticles() {
        particlesBuilt = true
        
        for p in 1...200 {
            let x = Double(arc4random()) % Double(frame.width)
            let y = Double(arc4random()) % Double(frame.height)
            let p = Particle(x: x, y: y)
            addChild(p.create())
        }
    }
    
    func moveParticleFieldToTouchArea() {
        
    }
}
