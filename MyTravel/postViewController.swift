//
//  postViewController.swift
//  MyTravel
//
//  Created by Paul Vagner on 11/14/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class postViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var logPicker: UIPickerView!
    
    
    @IBOutlet weak var imageToPost: postImageView!
    
    
    @IBOutlet weak var locationTF: UITextField!
   
    
    @IBOutlet weak var captionTF: UITextField!
    
    
    @IBAction func addLogButton(sender: Buttons) {
        
        
        
    }
    
    @IBAction func cancelButton(sender: Buttons) {
        
        
        
    }
    
    
    @IBAction func postButton(sender: Buttons) {
        
    }
    
    func numberOfComponentsInPickerView(logPicker: UIPickerView) -> Int {
        
        
        return 1
    }
    
    func pickerView(logPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return 2
    }
    
    var logData: [[String:AnyObject]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logPicker.dataSource = self
        logPicker.delegate = self
        
        var info = RequestInfo()
        
        info.endpoint = "/logs"
        info.method = .GET
        
        RailsRequest.session().requestWithInfo(info) { (returnedInfo) -> () in
            
            if let logs = returnedInfo?["logs"] as? [[String:AnyObject]] {
                
                self.logData = logs
                self.logPicker.reloadAllComponents()
                
            }
            
            if let id = returnedInfo?["id"] as? [[String:AnyObject]] {
                
                self.logData = id
                self.logPicker.reloadAllComponents()
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}










