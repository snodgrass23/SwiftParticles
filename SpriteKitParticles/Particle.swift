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
    
    init(x:Double, y:Double) {
        xPosition = x
        yPosition = y
    }
    
    func create() -> SKSpriteNode {
        particleBody.color = randomColor()
        particleBody.size = CGSizeMake(10, 10)
        drawAtNewPosition()
        return particleBody
    }
    
    func integrate() {
        var velocityX = xPosition - xPositionPrev
        var velocityY = yPosition - yPositionPrev
        xPositionPrev = xPosition
        yPositionPrev = yPosition
        xPosition += velocityX
        yPosition += velocityY
    }
    
    func attract(xTarget: Double, yTarget: Double) {
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
        let hue = Float(arc4random() % 256) / 256.0
        let saturation = Float(arc4random() % 128) / 256.0
        let brightness = Float(arc4random() % 128) / 256.0
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
}