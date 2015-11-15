//
//  LoginViewController.swift
//  login
//
//  Created by Susanne Burnham on 10/15/15.
//  Copyright © 2015 Susanne Kasahara. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    @IBAction func cancelButton(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func pressedLogin(sender: AnyObject) {
        
        let usernameRequest = RailsRequest.session()
        
        guard let username = usernameField.text where !username.isEmpty else { return }
        guard let password = passwordField.text where !password.isEmpty else { return }
        
        
        
        usernameRequest.loginWithUsername(username, andPassword: password)
        
        
        let loginSB = UIStoryboard(name: "FlashCardStoryboard", bundle: nil)
        
        if let flashVC = loginSB.instantiateInitialViewController() {
            
            self.navigationController?.setViewControllers([flashVC], animated: true)
            
            
        }
        
        
        func pressedRegister(sender: AnyObject) {
            
            let usernameRequest = RailsRequest.session()
            
            guard let username = usernameField.text where !username.isEmpty else { return }
            guard let emailField = emailField.text where !emailField.isEmpty else { return }
            guard let password = passwordField.text where !password.isEmpty else { return }
            
            usernameRequest.registerWithUsername(username, andPassword: password, email: emailField)
            
            
            let loginSB = UIStoryboard(name: "FlashCardStoryboard", bundle: nil)
            
            if let flashVC = loginSB.instantiateInitialViewController() {
                
                self.navigationController?.setViewControllers([flashVC], animated: true)
            }
            
            
        }
        
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        }
        
        func keyboardWillShow(sender: NSNotification) {
            self.view.frame.origin.y -= 150
        }
        
        func keyboardWillHide(sender: NSNotification) {
            self.view.frame.origin.y += 150
        }
    }
    
    
}