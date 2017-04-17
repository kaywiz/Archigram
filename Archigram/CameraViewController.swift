//
//  ViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/7/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit
import Clarifai

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //testing testing sourcetree

    @IBOutlet weak var imageDisplay: UIImageView!
    
    var imageToAnalyze: UIImage!
    
    var app = ClarifaiApp(
        appID: "S-kCOgG9TOuyJTa8V5r2-CSu_vXLhJZtLrLuUZDk", appSecret: "Q9B-oWmr0yqabyGEBPUnl3eZntS4ZjxoSZxKB9Se"
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!){
        imageDisplay.image = image
        imageToAnalyze = image
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func camerabuttonaction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }

    @IBAction func photolibraryaction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
    }


    @IBAction func folderTap(_ sender: Any) {
        self.performSegue(withIdentifier: "cameraToSaved", sender: self)
    }

    @IBAction func houseTap(_ sender: Any) {
        //self.performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    @IBAction func questionTap(_ sender: Any) {
        self.performSegue(withIdentifier: "cameraToHelp", sender: self)
    }
    
    @IBAction func findStyleTap(_ sender: UIButton) {
        self.performSegue(withIdentifier: "chosePicture", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chosePicture" ,
            let nextScene = segue.destination as? StyleViewController {
                nextScene.imageToAnalyze = imageToAnalyze
        }
    }


}

