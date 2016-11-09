//
//  AddPostVCViewController.swift
//  My hood
//
//  Created by Lewis Jones on 08/03/2016.
//  Copyright © 2016 Rodrigo Pena. All rights reserved.
//

import UIKit

class AddPostVCViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addPic: UIImageView!
    
    @IBOutlet weak var enterTitle: UITextField!
    
    @IBOutlet weak var enterDescription: UITextField!
    
    var imagePicker: UIImagePickerController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPic.layer.cornerRadius = addPic.frame.size.width / 2
        addPic.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        
    }
    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let title = enterTitle.text, let desc = enterDescription.text, let img = addPic.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
      }
    }
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        addPic.image = image
    }
    

}
