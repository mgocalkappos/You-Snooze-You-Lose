//
//  GameScene.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var hiScore = 0
let suspicionBar = SKLabelNode()
let awakeBar = SKLabelNode()
var suspicion = 0
var awake = 100


class FirstGameScene: SKScene {
    
    let tapToStartLabel = SKLabelNode()

    
    
    /*
     let snack = SKSpriteNode(imageNamed: <#T##String#>)
     let phone = SKSpriteNode(imageNamed: <#T##String#>)
     let textboook = SKSpriteNode(imageNamed: <#T##String#>)
     let notebook = SKSpriteNode(imageNamed: <#T##String#>)
     //laptop?
     */
    
    enum gameState{
        case preGame
        case inGame
        case afterGame
    }
    
    var currentGameState = gameState.preGame
    var area: CGRect
    
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        
        area = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        
        super.init(size: size)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        hiScore = 0
        
        
        for i in 0...1{
            
            let background = SKSpriteNode(imageNamed: "background")
            background.size = self.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0)
            background.position = CGPoint(x: self.size.width/2, y: self.size.height*CGFloat(i))
            background.zPosition = 0
            background.name = "Background"
            self.addChild(background)
            
        }
        //Add in suspicion bar
        
        //Add in awake bar
        
        tapToStartLabel.text = "Tap to Begin"
        tapToStartLabel.fontSize = 70
        tapToStartLabel.fontColor = SKColor.white
        tapToStartLabel.zPosition = 1
        tapToStartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        tapToStartLabel.alpha = 0
        self.addChild(tapToStartLabel)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        tapToStartLabel.run(fadeInAction)
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
    
    func startGame(){
        currentGameState = gameState.inGame
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([fadeOutAction, deleteAction])
        tapToStartLabel.run(deleteSequence)
        
        /*
         let spawnSnack = SKAction.moveTo(y: self.size.height*0.2, duration: 0.5)
         let action = SKAction.run(startNewLevel)
         let sequence = SKAction.sequence([spawnSnack, action])
         player.run(sequence)
         */
        
        //Move onto screen the two bars
        //Change background
        //Add entities
    }
    
    func changeScene(){
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
    }
    
    func addScore(){
        hiScore += 1
        
    }
    
    func runGameOver(){
        
        //switch to gameover scene
        currentGameState = gameState.afterGame
        
        //self.removeAllActions()
        
        //TODO remove all entities
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 1)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
        
        /*
         let changeSceneAction = SKAction.run(changeScene)
         let waitToChangeScene = SKAction.wait(forDuration: 1)
         let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
         self.run(changeSceneSequence)
         */
    }
    
    func check(){
        
        if(suspicion == 100 || awake == 0){
            runGameOver()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentGameState == gameState.inGame{
            startGame()
        }
        //if desk is touched, switch to desk scene
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //used for when finger has to be dragged across screen
        //probably won't need for now
    }
    
}
