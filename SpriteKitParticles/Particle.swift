//
//  Particle.swift
//  SpriteKitParticles
//
//  Created by Jim Snodgrass on 6/11/14.
//  Copyright (c) 2014 Jim Snodgrass. All rights reserved.
//

import Foundation
import SpriteKit

class Particle {
    var xPosition = 0.0
    var yPosition = 0.0
    var xPositionPrev = 0.0
    var yPositionPrev = 0.0
    var particleBody = SKSpriteNode()
    let damping = 0.95
    
    init(x:Double, y:Double) {
        xPosition = x
        yPosition = y
    }
    
    func create() -> SKSpriteNode {
        particleBody.color = SKColor.whiteColor()
        particleBody.size = CGSizeMake(5, 5)
        drawAtNewPosition()
        return particleBody
    }
    
    func nudge() {
        xPosition += 5
    }
    
    func integrate() {
        var velocityX = xPosition - xPositionPrev
        var velocityY = yPosition - yPositionPrev
        xPositionPrev = xPosition
        yPositionPrev = yPosition
        xPosition += velocityX * damping
        yPosition += velocityY * damping
    }
    
    func attractToXtarget(xTarget: Double, yTarget: Double) {
        var distanceX = xTarget - xPosition
        var distanceY = yTarget - yPosition
        var distance: Double = sqrt(distanceX * distanceX + distanceY * distanceY)
        xPosition += distanceX / distance
        yPosition += distanceY / distance
    }
    
    func drawAtNewPosition() {
        particleBody.position = CGPointMake(CGFloat(xPosition), CGFloat(yPosition))
    }
    
    func randomColor() -> UIColor {
        let hue = CGFloat(arc4random() % 256) / 256.0
        let saturation = CGFloat(arc4random() % 128) / 256.0
        let brightness = CGFloat(arc4random() % 128) / 256.0
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
}