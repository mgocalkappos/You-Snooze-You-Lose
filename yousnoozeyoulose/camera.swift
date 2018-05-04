//
//  camera.swift
//  yousnoozeyoulose
//
//  Created by Tommy Nguyen on 4/20/18.
//  Copyright © 2018 Nguyen. All rights reserved.
//

import Foundation
import UIKit

class camera: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    override func viewDidLoad() {
    
    //Display Camera
    let image = UIImagePickerController()
    image.delegate = self
    
    image.sourceType = UIImagePickerControllerSourceType.camera
    
    image.allowsEditing = false
    
        self.present(image, animated: true) {
            
            
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            
            
        } else {
            
            //Error
            
        }
    }
}
