//
//  File.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.cyan
        
        
        
        let title = SKLabelNode()
        title.text = "You Snooze You Lose"
        title.fontSize = 75
        title.fontColor = SKColor.black
        title.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.8)
        title.zPosition = 2
        self.addChild(title)
        
        let pencil1 = SKSpriteNode(imageNamed: "pencil13")
        pencil1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.65)
        pencil1.zPosition = 1
        self.addChild(pencil1)
        
        let play = SKLabelNode()
        play.text = "PLAY"
        play.fontSize = 70
        play.fontColor = SKColor.black
        play.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.63)
        play.zPosition = 2
        play.name = "playButton"
        self.addChild(play)
        

        let pencil2 = SKSpriteNode(imageNamed: "pencil23")
        pencil2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.525)
        pencil2.zPosition = 1
        self.addChild(pencil2)
        
        let settings = SKLabelNode()
        settings.text = "SETTINGS"
        settings.fontSize = 70
        settings.fontColor = SKColor.black
        settings.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.51)
        settings.zPosition = 2
        settings.name = "settingsButton"
        self.addChild(settings)
        
        let eraser = SKSpriteNode(imageNamed: "eraser3")
        eraser.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.405)
        eraser.zPosition = 1
        self.addChild(eraser)
        
        let shop = SKLabelNode()
        shop.text = "SHOP"
        shop.fontSize = 70
        shop.fontColor = SKColor.black
        shop.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        shop.zPosition = 2
        shop.name = "shopButton"
        self.addChild(shop)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            
            if nodeITapped.name == "playButton"{
                
                let sceneToMoveTo = GameScene(size: self.size) //Change to gameScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if nodeITapped.name == "settingsButton"{
                
                
                let sceneToMoveTo = SettingsScene(size: self.size) //Change to settingsScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            
            if nodeITapped.name == "shopButton"{
                
                let sceneToMoveTo = ShopScene(size: self.size) //Change to shopScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
 
            }
            
            
            
        }
    }
    
    
    
    
}
