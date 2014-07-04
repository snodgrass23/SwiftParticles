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
    var particles: Particle[] = []
    var Xtarget = 350.0
    var Ytarget = 550.0
    let numberOfParticles = 1000

    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        if !particlesBuilt {
            buildParticles()
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            Xtarget = Double(location.x)
            Ytarget = Double(location.y)
        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        for particle in particles {
            particle.attractToXtarget(Xtarget, yTarget: Ytarget)
            particle.integrate()
            particle.drawAtNewPosition()
        }
    }

    func buildParticles() {
        particlesBuilt = true
        let bounds = UIScreen.mainScreen().bounds
        let minX = frame.width - bounds.width
        
        for p in 1...numberOfParticles {
            
            let x = Double(arc4random()) % Double(frame.width)
            let y = Double(arc4random()) % Double(frame.height)
            let p = Particle(x: x, y: y)
            addChild(p.node)
            particles.append(p)
        }
    }
}
