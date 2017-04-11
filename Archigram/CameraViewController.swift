//
//  ViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/7/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageDisplay: UIImageView!
    
    var imageToAnalyze: UIImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!){
        imageDisplay.image = image
        imageToAnalyze = image
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func chooseFromLibrary(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
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

