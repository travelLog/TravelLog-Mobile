//
//  logAddViewController.swift
//  MyTravel
//
//  Created by Paul Vagner on 11/14/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class logAddViewController: UIViewController {

    @IBOutlet weak var addLogTextField: UITextField!
    
    @IBAction func cancelButton(sender: Buttons) {
    
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    @IBAction func acceptButton(sender: Buttons) {
      
        LogData.logSession().logsArray.append(addLogTextField.text!)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    
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
