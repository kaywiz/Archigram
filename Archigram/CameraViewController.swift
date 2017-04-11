//
//  ViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/7/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    @IBAction func cameraTap(_ sender: Any) {
        self.performSegue(withIdentifier: "chosePicture", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

