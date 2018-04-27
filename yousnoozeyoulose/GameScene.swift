//
//  GameScene.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit

var count = 90
var hiScore = 0
var suspicion = 0
var awake = 0
var time = true
var started = true

class GameScene: SKScene {
    //Creates timer
    var timer: Timer?
    
    //Creates awake and suspicion bar and desk
    var s = SKSpriteNode(imageNamed: "bluerect")
    var a = SKSpriteNode(imageNamed: "redbox")
    var outline = SKSpriteNode(imageNamed:"outlinebar")
    var outline2 = SKSpriteNode(imageNamed:"outlinebar")
    var slabel = SKLabelNode(fontNamed: "8BIT WONDER")
    var tlabel = SKLabelNode(fontNamed: "8BIT WONDER")
    
    
    var deskb = SKSpriteNode(imageNamed: "studentDeskGameScene")
   // var deskb = SKSpriteNode(imageNamed: "board2")
    var clock = SKSpriteNode(imageNamed: "clockGameScene")
    var laptop = SKSpriteNode(imageNamed: "laptopGameScene")
   var phone = SKSpriteNode(imageNamed: "phoneGameScene")
    var notebook = SKSpriteNode(imageNamed: "notebookGameScene")
    
    var whiteboard = SKSpriteNode(imageNamed:"whiteboard")
    var stick = SKSpriteNode(imageNamed:"stick2")
    var comp = SKSpriteNode(imageNamed:"computer")
    var eye = SKSpriteNode(imageNamed:"redcone")
    var classroom = SKSpriteNode(imageNamed: "classroom")

    var timeLeft = SKLabelNode(fontNamed: "8BIT WONDER")
    
    let tapToStartLabel = SKLabelNode()
    
    
    
    //Game states to determine what happens next (State pattern)
    enum gameState{
        case preGame
        case inGame
        case afterGame
    }
    
    //initially sets the game state to pregame
    var currentGameState = gameState.preGame
    var area: CGRect
    
    //Creates playable screen
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
    
    //Initial start up (objects, tap to begin label)
    override func didMove(to view: SKView) {
        hiScore = 0
        

       /* for i in 0...1{
            
            let background = SKSpriteNode(imageNamed: "background")
            background.size = self.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0)
            background.position = CGPoint(x: self.size.width/2, y: self.size.height*CGFloat(i))
            background.zPosition = 0
            background.name = "floor"
            self.addChild(background)
            
        }
            */
        
        if started == true{
            tapToStartLabel.text = "Tap to Begin"
            tapToStartLabel.fontSize = 70
            tapToStartLabel.fontColor = SKColor.black
            tapToStartLabel.zPosition = 1
            tapToStartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            tapToStartLabel.alpha = 0
            self.addChild(tapToStartLabel)
            
            let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
            tapToStartLabel.run(fadeInAction)
        } else {
            currentGameState = gameState.inGame
            startGame()
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
            a.size = CGSize(width: awake*3, height: 50)
            s.size = CGSize(width: suspicion*3, height: 50)
        if suspicion <= 0 {
            suspicion = 0
        }
        if awake <= 0 {
            awake = 0
        }
        eye.zRotation += -CGFloat(5.degreesToRadians)
    }

    //Called every second to update count
    func updateCount(){
        if(count > 0){
            print("\(awake)")
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
    
    
    //Called to check on the bars
    func check(){

        if awake >= 100 || suspicion >= 100 {
            print("run game over")
            runGameOver()
        }
    }
    
    //Called after the taptobegin label is pressed
    func startGame(){
        print("starting game")
        time = true
        started = false
        
        if  started == true{
            suspicion = 0
            awake = 0
        }
        currentGameState = gameState.inGame

        //Creates timer to tick and called the method updateCount every second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateCount"), userInfo: nil, repeats: time)
        
        //Fades out the tap to begin label
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([fadeOutAction, deleteAction])
        tapToStartLabel.run(deleteSequence)
        
        //suspicion bar
        s.size = CGSize(width: suspicion*3,height: 50)
        s.anchorPoint = CGPoint(x: 0,y: 0.5)
        s.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.5)
        s.zPosition = 3
        self.addChild(s)
        
        outline.size = CGSize(width: 300, height: 50)
        outline.anchorPoint = CGPoint(x: 0,y: 0.5)
        outline.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.5)
        outline.zPosition = 2
        self.addChild(outline)
        
        slabel.text = "suspicion"
        slabel.fontColor = SKColor.black
        slabel.fontSize = 40
        slabel.zPosition = 4
        slabel.position = CGPoint(x: self.size.width*0.120, y: self.size.height*0.49)
        self.addChild(slabel)
        
        //awake bar
        a.size = CGSize(width: awake*3,height: 50)
        a.anchorPoint = CGPoint(x: 0,y: 0.5)
        a.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.55)
        a.zPosition = 3
        self.addChild(a)
        
        outline2.size = CGSize(width: 300, height: 50)
        outline2.anchorPoint = CGPoint(x:0,y: 0.5)
        outline2.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.55)
        outline2.zPosition = 2
        self.addChild(outline2)
        
        tlabel.text = "tiredness"
        tlabel.fontColor = SKColor.black
        tlabel.fontSize = 40
        tlabel.zPosition = 4
        
        tlabel.position = CGPoint(x: self.size.width*0.120, y: self.size.height*0.54)
        self.addChild(tlabel)
        
        
        //RESIZE
        //Desk parts
        deskb.position = CGPoint(x: self.size.width*0.57, y: self.size.height*0.135)
        deskb.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        deskb.zPosition = 2
        deskb.setScale(1.5)
        deskb.name = "deskb"
        self.addChild(deskb)
        
        whiteboard.position = CGPoint(x:self.size.width*0.6, y: self.size.height*0.7)
        whiteboard.zPosition = 2
        whiteboard.name = "whiteboard"
        self.addChild(whiteboard)

        stick.position = CGPoint(x:self.size.width*0.9, y: self.size.height*0.5)
        stick.zPosition = 2
        stick.name = "stick"
        self.addChild(stick)

        eye.anchorPoint = CGPoint(x:0.5, y: 1)
        eye.position = CGPoint(x:self.size.width*0.895, y: self.size.height*0.6)
        eye.zPosition = 4
        eye.setScale(3)
        eye.alpha = 0.4
        eye.zRotation = 0.2
        self.addChild(eye)
        //Clock
        clock.position = CGPoint(x:self.size.width*0.27, y: self.size.height*0.65)
        clock.zPosition = 2
        clock.setScale(1.5)
        self.addChild(clock)
        
        
        //Phone
        phone.position = CGPoint(x:self.size.width * 0.7, y: self.size.height*0.15)
        phone.zPosition = 3
        phone.name = "phone"
        self.addChild(phone)
        //Laptop
        laptop.position = CGPoint(x:self.size.width * 0.55, y: self.size.height*0.17)
        laptop.zPosition = 3
        laptop.name = "laptop"
        self.addChild(laptop)
        
        //Notebook
        notebook.position = CGPoint(x:self.size.width * 0.46, y: self.size.height*0.13)
        notebook.zPosition = 3
        notebook.name = "notebook"
        self.addChild(notebook)
 
        
        classroom.position = CGPoint(x:self.size.width*0, y: self.size.height*0.5)
        classroom.zPosition = 0
        classroom.anchorPoint = CGPoint(x:0, y:0.5)
        classroom.setScale(2)
        self.addChild(classroom)
        
        
        timeLeft.fontSize = 60
        timeLeft.fontColor = SKColor.black
        timeLeft.zPosition = 3
        timeLeft.position = CGPoint(x: self.size.width*0.74, y: self.size.height*0.78)
        self.addChild(timeLeft)
        

    }
    
    //Called when the game ends to switch the scene to the gameover layout
    func changeScene(){
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
    }
    
    //Stops the timer when called
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
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
        self.run(changeSceneSequence)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //initial touch starts the game and switches gamestates
        if currentGameState == gameState.preGame{
            startGame()
        }
        
        //Checks for everytime an object is touch and executes its respective responsibilty
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            //Detects when the desk is touched
            if nodeITapped.name == "deskb" || nodeITapped.name == "laptop" || nodeITapped.name == "phone" || nodeITapped.name == "notebook"{
                updateTimer(timer: timer!)
                
                //Fades the scene to switch over to the desk view
                let sceneToMoveTo = GameGameScene(size: self.size) //Change to gameScene
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            
        }

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //used for when finger has to be dragged across screen
        //phone implementation?
    }
}
