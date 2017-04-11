//
//  SavedViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/10/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet var questionTap: UIButton!
    
    @IBAction func questionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "savedToHelp", sender: self)
    }
    
    @IBAction func houseButton(_ sender: Any) {
        self.performSegue(withIdentifier: "savedToCamera", sender: self)
        
    }
    
    @IBAction func folderButton(_ sender: Any) {
        //self.performSegue(withIdentifier: "savedToCamera", sender: self)
    }
    
    @IBAction func buildingButton(_ sender: Any) {
        self.performSegue(withIdentifier: "savedToStyle", sender: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
