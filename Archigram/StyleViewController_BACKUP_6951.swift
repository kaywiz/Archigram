//
//  StyleViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/10/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

class StyleViewController: UIViewController {
    
<<<<<<< HEAD
    @IBOutlet weak var imageDisplay: UIImageView!
    var imageToAnalyze: UIImage!

=======
    @IBOutlet weak var analyzedPhoto: UIImageView!
>>>>>>> b37ff743f7fa5c0d9228e0262d1e3b4804c9903f
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageDisplay.image = imageToAnalyze
    }
    
    @IBAction func folderTap(_ sender: Any) {
        self.performSegue(withIdentifier: "styleToSaved", sender: self)
    }
    
    @IBAction func houseTap(_ sender: Any) {
        //self.performSegue(withIdentifier: "styleToSaved", sender: self)
    }
    
    @IBAction func questionTap(_ sender: Any) {
        self.performSegue(withIdentifier: "styleToHelp", sender: self)
    }
    
    @IBAction func quitButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let photoSave = analyzedPhoto.image {
            UIImageWriteToSavedPhotosAlbum(photoSave, nil, nil, nil)
        }
    }
    
    @IBAction func wikiButton(_ sender: Any) {
        self.performSegue(withIdentifier: "wikiClick", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
