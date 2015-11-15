//
//  imagePreViewController.swift
//  MyTravel
//
//  Created by Paul Vagner on 11/14/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class imagePreViewController: UIViewController {
    
    var originalImage: UIImage?
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    
    @IBAction func retakeButton(sender: Buttons) {
        
    }
    
    
    @IBAction func okButton(sender: Buttons) {
   
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewImageView.image = originalImage!
     
        print("This is the image \(originalImage)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
