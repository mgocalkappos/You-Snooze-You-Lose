//
//  GameViewController.swift
//  yousnoozeyoulose
//
//  Created by Tyler Nguyen on 2/19/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

        var backingAudio = AVAudioPlayer()

class GameViewController: UIViewController {

    var countLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()



        
        let filePath = Bundle.main.path(forResource: "Off Limits", ofType: "wav")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)
        
        do{ backingAudio = try AVAudioPlayer(contentsOf: audioNSURL as URL) }
        catch {return print("Cannot Find the Audio")}
        
        backingAudio.numberOfLoops = -1
        backingAudio.volume = 1
        backingAudio.play()

 
        
        let scene = MainMenuScene(size: CGSize(width: 2048, height: 1536))
        //Configure the view
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = false
        
        skView.ignoresSiblingOrder = true
        
       scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    func update(){

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            
            
        } else {
            
            //Error
            
        }
    }
}
