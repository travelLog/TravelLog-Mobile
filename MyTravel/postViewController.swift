//
//  postViewController.swift
//  MyTravel
//
//  Created by Paul Vagner on 11/14/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class postViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var originalImage: UIImage?
    
    @IBOutlet weak var logPicker: UIPickerView!
    
    
    @IBOutlet weak var imageToPost: postImageView!
    
    
    @IBOutlet weak var locationTF: UITextField!
   
    
    @IBOutlet weak var captionTF: UITextField!

    
    
    @IBAction func addLogButton(sender: Buttons) {
        

        let logAddVC = storyboard?.instantiateViewControllerWithIdentifier("logAddVC") as! logAddViewController
        
//        navigationController?.viewControllers = [logAddVC]
        
        presentViewController(logAddVC, animated: true, completion: nil)
        
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return LogData.logSession().logsArray[row]
        
    }
    
    @IBAction func cancelButton(sender: Buttons) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    @IBAction func postButton(sender: Buttons) {
        
        
    }
    
    func numberOfComponentsInPickerView(logPicker: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(logPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return LogData.logSession().logsArray.count
    }
    
    var logData: [[String:AnyObject]] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        logPicker.reloadAllComponents()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        logPicker.dataSource = self
        logPicker.delegate = self
        
        var info = RequestInfo()
        
        info.endpoint = "/logs"
        info.method = .GET
        
        RailsRequest.session().requestWithInfo(info) { (returnedInfo) -> () in
            
            print(returnedInfo)
            
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










