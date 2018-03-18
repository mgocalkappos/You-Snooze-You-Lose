//
//  GameScene.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit
extension Int {
    var degreesToRadians: Double { return Double(self) * M_PI / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / M_PI }
}
class GameGameScene: SKScene {

    
     let snack = SKSpriteNode(imageNamed: "snack3")
     let phone = SKSpriteNode(imageNamed: "phone3")
     let laptop = SKSpriteNode(imageNamed: "laptop3")
     let notebook = SKSpriteNode(imageNamed: "notebook3")
    var slabel = SKLabelNode()
    var tlabel = SKLabelNode()
    
    var finger = SKSpriteNode(imageNamed:"finger")

    var outline = SKSpriteNode(imageNamed:"outlinebar")
    var outline2 = SKSpriteNode(imageNamed:"outlinebar")
    
    var timer: Timer?
    var timer2: Timer?
    var s = SKSpriteNode(imageNamed: "redbox")
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
        snack.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        snack.zPosition = 1
        snack.name = "snack"
        snack.setScale(1.5)
        self.addChild(snack)
        
        phone.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.5)
        phone.zPosition = 1
        phone.name = "phone"
        phone.setScale(2)
        self.addChild(phone)
        
        laptop.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.3)
        laptop.zPosition = 1
        laptop.name = "laptop"
        laptop.setScale(1.5)
        self.addChild(laptop)
        
        notebook.position = CGPoint(x: self.size.width*0.15, y: self.size.height*0.4)
        notebook.zPosition = 1
        notebook.name = "notebook"
        notebook.setScale(1.2)
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
        
      //  let oneRevolution:SKAction = SKAction.rotate(byAngle: -CGFloat.pi * 2, duration: 3.5)
       // let repeatRotation:SKAction = SKAction.repeatForever(oneRevolution)
        
      //  u.run(repeatRotation)
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
        print(u.zRotation)
    }
    
    func updateCount(){
        if(count > 0){
            
            print("\(awake)")
            count -= 1
            awake += 3
            check()
        }

    }
    
    
    func check(){

        if awake > 100 || suspicion > 100 {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.afterGame{
            runGameOver()
        }

        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "snack"{
                awake -= 5
                suspicion += 7
            }
            if nodeITapped.name == "phone"{
                awake -= 12
                suspicion += 20
            }
            if nodeITapped.name == "laptop"{
                awake += 12
                suspicion -= 7
            }
            if nodeITapped.name == "notebook"{
                awake += 20
                suspicion -= 15
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
