//
//  Particle.swift
//  SpriteKitParticles
//
//  Created by Jim Snodgrass on 6/11/14.
//  Copyright (c) 2014 Jim Snodgrass. All rights reserved.
//

import Foundation

class Particle {
    var xPosition: Double = 0.0
    var yPosition: Double = 0.0
    var xPositionPrev: Double = 0.0
    var yPositionPrev: Double = 0.0
    
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
        var 
    }
    
}