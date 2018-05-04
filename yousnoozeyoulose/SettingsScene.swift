//
//  MainMenuScene.swift
//  You Snooze You Lose
//
//  Created by Tyler Nguyen on 8/7/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

class SettingsScene: SKScene {
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let settingLabel = SKLabelNode(fontNamed: "8BIT WONDER")
        settingLabel.text = "Settings"
        settingLabel.fontSize = 70
        settingLabel.fontColor = SKColor.white
        settingLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.8)
        settingLabel.zPosition = 1
        self.addChild(settingLabel)
        
        let music = SKLabelNode(fontNamed: "8BIT WONDER")
        music.text = "Toggle Music"
        music.fontSize = 60
        music.fontColor = SKColor.white
        music.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.7)
        music.zPosition = 1
        music.name = "musicButton"
        self.addChild(music)
        
        let backtoMain = SKLabelNode(fontNamed: "8BIT WONDER")
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
            
            
            if nodeITapped.name == "musicButton"{
                if(backingAudio.volume > 0){
                    //mute music
                    if #available(iOS 10.0, *) {
                        backingAudio.setVolume(0, fadeDuration: 0)
                    } else {
                        // Fallback on earlier versions
                    }

                } else {
                    if #available(iOS 10.0, *) {
                        backingAudio.setVolume(0.05, fadeDuration: 0)
                        backingAudio.play()
                    } else {
                        // Fallback on earlier versions
                    }
                
                }
            }
            
            if nodeITapped.name == "backButton"{
                
                let sceneToMoveTo = MainMenuScene(size: self.size) //Change to gameScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }

        }
    }
    
    
    
    
}
