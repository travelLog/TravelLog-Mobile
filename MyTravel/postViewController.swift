//
//  postViewController.swift
//  MyTravel
//
//  Created by Paul Vagner on 11/14/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class postViewController: UIViewController {

    
    @IBOutlet weak var logPicker: UIPickerView!
    
    
    @IBOutlet weak var imageToPost: postImageView!
    
  
    @IBOutlet weak var locationTF: UITextField!
    
    
    @IBOutlet weak var captionTF: UITextField!
    
    
    
    
    @IBAction func addLogButton(sender: Buttons) {
    }
    
    @IBAction func retakeButton(sender: Buttons) {
    }
    
    
    @IBAction func postButton(sender: Buttons) {
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
