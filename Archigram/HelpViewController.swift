//
//  HelpViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/10/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func folderButton(_ sender: Any) {
        self.performSegue(withIdentifier: "helpToSaved", sender: self)
    }
    
    @IBAction func houseButton(_ sender: Any) {
        self.performSegue(withIdentifier: "helpToCamera", sender: self)
    }
    
    @IBAction func questionButton(_ sender: Any) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
