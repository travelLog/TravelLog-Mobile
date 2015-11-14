//
//  CaptureViewController.swift
//  MyTravel
//
//  Created by Anjel Villafranco on 11/14/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //    @property (weak, nonatomic) IBOutlet UIView *cameraHolderView;
    //
    //    @property UIImagePickerController * picker;
    
    @IBOutlet weak var cameraHolderView: UIView!
    
    var picker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.picker.sourceType = UIImagePickerControllerSourceType.Camera; //Getter
        self.picker.delegate = self;
        self.picker.cameraDevice = UIImagePickerControllerCameraDevice.Front;
        self.picker.showsCameraControls = false; //removes camera controls since Im using custom button.
        
        self.picker.view.frame = self.cameraHolderView.bounds;
        //self.picker.view.frame.size.width = newWidth; <- SWIFT
        
        //        [self.cameraHolderView addSubview:self.picker.view];
        self.cameraHolderView.addSubview(self.picker.view)
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        print("%f %f", self.cameraHolderView.bounds.size.width, self.cameraHolderView.bounds.size.height)
        
        var newFrame: CGRect = self.picker.view.frame
        
        newFrame.size.width = newFrame.size.height / 4 * 3.1
        
        newFrame.origin.x = (self.cameraHolderView.frame.size.width - newFrame.size.width) / 2
        
        print("%f %f", newFrame.size.width, newFrame.size.height)
        
        self.picker.view.frame = newFrame
        
        
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        
        self.picker.takePicture()
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        let image = editingInfo?[UIImagePickerControllerOriginalImage] as? UIImage
        
        let imageVC = self.storyboard?.instantiateViewControllerWithIdentifier("imagePreView") as? imagePreViewController
        
        imageVC?.originalImage = flipImage(image!)
        
        self.navigationController?.pushViewController(imageVC!, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        <#code#>
    }
    
}









