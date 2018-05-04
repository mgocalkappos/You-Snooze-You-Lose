//
//  GameOverScene.swift
//  space invaders
//
//  Created by Tyler Nguyen on 8/7/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    
    let restartLabel = SKLabelNode(fontNamed: "8BIT WONDER")
    let mainMenuLabel = SKLabelNode(fontNamed: "8BIT WONDER")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "8BIT WONDER")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 100
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        gameOverLabel.zPosition = 1
        
        self.addChild(gameOverLabel)
  /*
        let scoreLabel = SKLabelNode()
        scoreLabel.text = "Score: \(hiScore)"
        scoreLabel.fontSize = 100
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if hiScore > highScoreNumber{
            highScoreNumber = hiScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
        
        let highScoreLabel = SKLabelNode()
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 100
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        highScoreLabel.zPosition = 1
        
        self.addChild(highScoreLabel)
    */
        restartLabel.text = "Restart"
        restartLabel.fontSize = 100
        restartLabel.fontColor = SKColor.white
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        restartLabel.zPosition = 1
        
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontSize = 100
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        mainMenuLabel.zPosition = 1
        
        self.addChild(restartLabel)
        self.addChild(mainMenuLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            
            if restartLabel.contains(pointOfTouch){
                started = true
                awake = 0
                suspicion = 0
                count = 60
                let newScene = GameScene(size: self.size)
                newScene.scaleMode = self.scaleMode
                let animation = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(newScene, transition: animation)
            }
            
            if mainMenuLabel.contains(pointOfTouch){
                started = true
                awake = 0
                suspicion = 0
                count = 60
                let newScene = MainMenuScene(size: self.size)
                newScene.scaleMode = self.scaleMode
                let animation = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(newScene, transition: animation)
            }
            
        }
        
        
        
    }
    
    
    
    
}
