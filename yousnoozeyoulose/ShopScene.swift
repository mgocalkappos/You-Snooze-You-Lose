//
//  MainMenuScene.swift
//  space invaders
//
//  Created by Tyler Nguyen on 8/7/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

class ShopScene: SKScene {
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let settingLabel = SKLabelNode()
        settingLabel.text = "Shop"
        settingLabel.fontSize = 70
        settingLabel.fontColor = SKColor.white
        settingLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.8)
        settingLabel.zPosition = 1
        self.addChild(settingLabel)
        
        let backtoMain = SKLabelNode(fontNamed: "The Bold Font")
        backtoMain.text = "BACK"
        backtoMain.fontSize = 50
        backtoMain.fontColor = SKColor.white
        backtoMain.position = CGPoint(x: self.size.width*0.1, y: self.size.height*0.8)
        backtoMain.zPosition = 1
        backtoMain.name = "backButton"
        self.addChild(backtoMain)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)

            if nodeITapped.name == "backButton"{
                
                let sceneToMoveTo = MainMenuScene(size: self.size) //Change to gameScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }

        }
    }
    
    
    
    
}
