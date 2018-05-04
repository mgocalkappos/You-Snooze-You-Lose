//
//  GameScene.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

extension Int {
    var degreesToRadians: Double { return Double(self) * M_PI / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / M_PI }
}
class GameGameScene: SKScene {
    
    var timeLeft = SKLabelNode(fontNamed: "8BIT WONDER")
    
    let sn = 1
    let p = -1
    let l = -1
    let n = -1
    
    var snackA = 5
    var snackS = 8
    var phoneA = 12
    var phoneS = 20
    var laptopA = 12
    var laptopS = 8
    var notebookA = 20
    var notebookS = 16

    var multiplier: Int = 1
    
     let snack = SKSpriteNode(imageNamed: "candyGameScene")
     let phone = SKSpriteNode(imageNamed: "phone3")
     let laptop = SKSpriteNode(imageNamed: "laptopGGS")
     let notebook = SKSpriteNode(imageNamed: "notebookGGS")
    var slabel = SKLabelNode(fontNamed: "8BIT WONDER")
    var tlabel = SKLabelNode(fontNamed: "8BIT WONDER")
  
    
    var finger = SKSpriteNode(imageNamed:"finger")

    var outline = SKSpriteNode(imageNamed:"outlinebar")
    var outline2 = SKSpriteNode(imageNamed:"outlinebar")
    
    var timer: Timer?
    var timer2: Timer?
    var s = SKSpriteNode(imageNamed: "bluerect")
    var a = SKSpriteNode(imageNamed: "redbox")
    var u = SKSpriteNode(imageNamed: "urgency")
    
    
    
    enum gameState{
        case preGame
        case inGame
        case afterGame
    }
    
    var currentGameState = gameState.inGame
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
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateCount"), userInfo: nil, repeats: time)
        
        
        for i in 0...1{
            
            let background = SKSpriteNode(imageNamed: "brownDesk")
            background.size = self.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0)
            background.position = CGPoint(x: self.size.width/2, y: self.size.height*CGFloat(i))
            background.zPosition = 0
            background.name = "Background"
            self.addChild(background)
            
        }
        snack.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        snack.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        snack.zPosition = 1
        snack.name = "snack"
        snack.setScale(2)
        self.addChild(snack)
        
        //phone.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        phone.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.5)
        phone.zPosition = 1
        phone.name = "phone"
        //phone.setScale(2)
        self.addChild(phone)
        
        //laptop.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        laptop.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.32)
        laptop.zPosition = 1
        laptop.name = "laptop"
       // laptop.setScale(1.5)
        self.addChild(laptop)
        
        //notebook.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        notebook.position = CGPoint(x: self.size.width*0.15, y: self.size.height*0.4)
        notebook.zPosition = 1
        notebook.name = "notebook"
        //notebook.setScale(1.2)
        self.addChild(notebook)
        
        //suspicion bar
        s.size = CGSize(width: suspicion*3,height: 50)
        s.anchorPoint = CGPoint(x: 0,y: 0.5)
        s.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.75)
        s.zPosition = 2
        self.addChild(s)
        
        outline.size = CGSize(width: 300, height: 50)
        outline.anchorPoint = CGPoint(x: 0,y: 0.5)
        outline.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.75)
        outline.zPosition = 1
        self.addChild(outline)
        
        slabel.text = "suspicion"
        slabel.fontColor = SKColor.black
        slabel.fontSize = 40
        slabel.zPosition = 4
        slabel.position = CGPoint(x: self.size.width*0.87, y: self.size.height*0.74)
        self.addChild(slabel)
        
        //awake bar
        a.size = CGSize(width: awake*3,height: 50)
        a.anchorPoint = CGPoint(x: 0,y: 0.5)
        a.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.8)
        a.zPosition = 2
        self.addChild(a)
        
        outline2.size = CGSize(width: 300, height: 50)
        outline2.anchorPoint = CGPoint(x: 0,y: 0.5)
        outline2.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.8)
        outline2.zPosition = 1
        self.addChild(outline2)
        
        tlabel.text = "tiredness"
        tlabel.fontColor = SKColor.black
        tlabel.fontSize = 40
        tlabel.zPosition = 4
        tlabel.position = CGPoint(x: self.size.width*0.87, y: self.size.height*0.79)
        self.addChild(tlabel)
        
        //Urgency Bar
        u.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.75)
        u.zPosition = 1
        
        timeLeft.fontSize = 60
        timeLeft.fontColor = SKColor.black
        timeLeft.zPosition = 3
        timeLeft.position = CGPoint(x: self.size.width*0.85, y: self.size.height*0.15)
        self.addChild(timeLeft)
        
        self.addChild(u)
    
        finger.position = CGPoint(x:self.size.width*0.33, y:self.size.height*0.85)
        finger.zPosition = 2
        finger.zRotation = CGFloat.pi/2*1.5
        finger.setScale(0.35)
        self.addChild(finger)
        
        let backtoMain = SKLabelNode()
        backtoMain.text = "BACK"
        backtoMain.fontSize = 50
        backtoMain.fontColor = SKColor.white
        backtoMain.position = CGPoint(x: self.size.width*0.1, y: self.size.height*0.8)
        backtoMain.zPosition = 1
        backtoMain.name = "backButton"
        self.addChild(backtoMain)

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        a.size = CGSize(width: awake*3, height: 50)
        s.size = CGSize(width: suspicion*3, height: 50)
        
        if suspicion <= 0 {
            print("suspicion <= 0")
            suspicion = 0
        }
        if awake <= 0 {
            print("awake >= 100")
            awake = 0
        }
        u.zRotation += -CGFloat(1.degreesToRadians)
        print(NSLog("%f",u.zRotation))
        
        if(u.zRotation <= -3.2 && u.zRotation >= -4.8){
            
            multiplier = 2
            
        } else {
            multiplier = 1
        }
        if(u.zRotation <= -6.4){
            u.zRotation = 0
        }
        
    }
    
    func updateCount(){
        if(count > 0){
            
            print(NSLog("%f", awake))
            count -= 1
            awake += 2
            check()
        }
        timeLeft.text = secondToMinute(seconds: count)

    }
    
    func secondToMinute(seconds: Int) -> String {
        var minutes = (seconds % 3600) / 60
        var seconds = (seconds % 3600) % 60
        if(seconds < 10) {
            
            
        }
        return "\(minutes) : \(seconds)"
    }
    
    func check(){

        if awake >= 100 || suspicion >= 100 {
            print("game over")
            runGameOver()
        }
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
    
    func updateTimer(timer: Timer){
        timer.invalidate()
        print("stopping timer")
    }
    
    func runGameOver(){
        
        //switch to gameover scene
        currentGameState = gameState.afterGame
        updateTimer(timer: timer!)
        self.removeAllActions()
        
        //TODO remove all entities
        print("running game over")
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 0.5)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
        self.run(changeSceneSequence)
        
    }
    
    func spawnTPlusMinusStat(spawnPosition: CGPoint, susValue: Int, tireValue: Int){
        let stat = SKLabelNode()
        let tstat = SKLabelNode()
        let blank = SKLabelNode()
        var sus = String(susValue)
        var tire = String(tireValue)
        stat.fontSize = 100
        stat.fontColor = SKColor.red
        stat.fontName = "AvenirNext-Bold"
        stat.text = "+ \(tire)"
        stat.position = spawnPosition
        stat.zPosition = 3
        stat.setScale(0.5)
        self.addChild(stat)
        self.addChild(blank)
        tstat.fontSize = 100
        tstat.fontColor = SKColor.blue
        tstat.fontName = "AvenirNext-Bold"
        tstat.text = "       - \(sus)"
        tstat.position = CGPoint(x: spawnPosition.x, y: (spawnPosition.y - spawnPosition.y*0.15))
        tstat.zPosition = 3
        tstat.setScale(0.5)
        self.addChild(tstat)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.15)
        let fadeOut = SKAction.fadeOut(withDuration: 0.4)
        
        let delete = SKAction.removeFromParent()
        
        let statSequence = SKAction.sequence([scaleIn, fadeOut, delete])
        let tstatSequence = SKAction.sequence([scaleIn, fadeOut, delete])
        
        stat.run(statSequence)
        tstat.run(tstatSequence)
    }
    
    func spawnTMinusPlusStat(spawnPosition: CGPoint, susValue: Int, tireValue: Int){
        let stat = SKLabelNode()
        let tstat = SKLabelNode()
        let blank = SKLabelNode()
        var sus = String(susValue)
        var tire = String(tireValue)
        stat.fontSize = 100
        stat.fontColor = SKColor.red
        stat.fontName = "AvenirNext-Bold"
        stat.text = "- \(tire)"
        stat.position = spawnPosition
        stat.zPosition = 3
        stat.setScale(0.5)
        self.addChild(stat)
        self.addChild(blank)
        tstat.fontSize = 100
        tstat.fontColor = SKColor.blue
        tstat.fontName = "AvenirNext-Bold"
        tstat.text = "       + \(sus)"
        tstat.position = CGPoint(x: spawnPosition.x, y: (spawnPosition.y - spawnPosition.y*0.15))
        tstat.zPosition = 3
        tstat.setScale(0.5)
        self.addChild(tstat)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.15)
        let fadeOut = SKAction.fadeOut(withDuration: 0.4)
        
        let delete = SKAction.removeFromParent()
        
        let statSequence = SKAction.sequence([scaleIn, fadeOut, delete])
        let tstatSequence = SKAction.sequence([scaleIn, fadeOut, delete])
        
        stat.run(statSequence)
        tstat.run(tstatSequence)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.afterGame{
            runGameOver()
        }

        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "snack"{
                awake -= snackA
                suspicion += multiplier*snackS
                
                var checkS = snackS
                if(u.zRotation <= -3.2 && u.zRotation >= -4.8){
                    
                    checkS *= 2
                    
                } else {
                    checkS *= 1
                }
                
                if(sn < 0){
                    spawnTPlusMinusStat(spawnPosition: snack.position, susValue: checkS, tireValue: snackA)
                } else if(sn > 0){
                    spawnTMinusPlusStat(spawnPosition: snack.position, susValue: checkS,tireValue: snackA)
                }
            }
            if nodeITapped.name == "phone"{
                awake -= phoneA
                suspicion += multiplier*phoneS
                
                var checkS = phoneS
                if(u.zRotation <= -3.2 && u.zRotation >= -4.8){
                    
                    checkS *= 2
                    
                } else {
                    checkS *= 1
                }
                
                if(p < 0){
                    spawnTPlusMinusStat(spawnPosition: phone.position, susValue: checkS, tireValue: phoneA)
                } else if(p > 0){
                    spawnTMinusPlusStat(spawnPosition: phone.position, susValue: checkS, tireValue:  phoneA)
                }
                
              //  cameraView.viewDidLoad()
                
            }
            if nodeITapped.name == "laptop"{
                awake += laptopA
                suspicion -= multiplier*laptopS
                
                var checkS = laptopS
                if(u.zRotation <= -3.2 && u.zRotation >= -4.8){
                    
                    checkS *= 2
                    
                } else {
                    checkS *= 1
                }
                
                if(l < 0){
                    spawnTPlusMinusStat(spawnPosition: laptop.position, susValue: checkS, tireValue: laptopA)
                } else if(l > 0){
                    spawnTMinusPlusStat(spawnPosition: laptop.position, susValue: checkS, tireValue: laptopA)
                }
            }
            if nodeITapped.name == "notebook"{
                awake += notebookA
                suspicion -= multiplier*notebookS
                
                var checkS = notebookS
                
                if(u.zRotation <= -3.2 && u.zRotation >= -4.8){
                    
                    checkS *= 2
                    
                } else {
                    checkS *= 1
                }
                
                if(n < 0){
                    spawnTPlusMinusStat(spawnPosition: notebook.position, susValue: checkS, tireValue: notebookA)
                } else if(n > 0){
                    spawnTMinusPlusStat(spawnPosition: notebook.position, susValue: checkS, tireValue: notebookA)
                }
                
                updateTimer(timer: timer!)
                let sceneToMoveTo = drawing(size: self.size) //Change to drawing Scene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if nodeITapped.name == "backButton"{
                updateTimer(timer: timer!)
                let sceneToMoveTo = GameScene(size: self.size) //Change to gameScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //used for when finger has to be dragged across screen
        
    }
    
}
