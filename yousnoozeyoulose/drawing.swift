//
//  File.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class drawing: SKScene {
    
    override func didMove(to view: SKView) {
        for i in 0...1{
            
            let background = SKSpriteNode(imageNamed: "notebook")
            background.size = self.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            background.zPosition = 0
            background.name = "Background"
            background.setScale(0.8)
            self.addChild(background)
        }
        
        
        let backtoMain = SKLabelNode()
        backtoMain.text = "BACK"
        backtoMain.fontSize = 50
        backtoMain.fontColor = SKColor.red
        backtoMain.position = CGPoint(x: self.size.width*0.1, y: self.size.height*0.8)
        backtoMain.zPosition = 1
        backtoMain.name = "backButton"
        self.addChild(backtoMain)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)

            if (nodeITapped.name == "Background"){
                let shape = SKSpriteNode(imageNamed: "dot")
                shape.position = pointOfTouch
                shape.zPosition = 1
                shape.setScale(0.5)
                self.addChild(shape)
            }
            
            if nodeITapped.name == "backButton"{
                let sceneToMoveTo = GameGameScene(size: self.size) //Change to gameScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
        }
 

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if (nodeITapped.name == "Background"){
            let shape = SKSpriteNode(imageNamed: "dot")
            shape.position = pointOfTouch
            shape.setScale(0.5)
            shape.zPosition = 1
            self.addChild(shape)
        }
            if (pointOfTouch != previousPointOfTouch){
                let shape = SKSpriteNode(imageNamed: "dot")
                shape.position = previousPointOfTouch
                shape.setScale(0.5)
                shape.zPosition = 1
                self.addChild(shape)
            }

        }
    
    }
    
}

