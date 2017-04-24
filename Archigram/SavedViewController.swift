//
//  SavedViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/10/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theCollection.dataSource = self
        theCollection.delegate = self
        print("run image count")
        imgCount = getImgCount()
        print("image count is \(imgCount)")
        print("run images to array")
        imagesToArray()
    }
    
    @IBOutlet var questionTap: UIButton!
    
    @IBOutlet weak var theCollection: UICollectionView!
    
    var imgCount: Int = 0
    var arrayOfImg: [UIImage] = []
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return getImgCount()
    }
    
    func getImgCount() -> Int {
        let count =  UserDefaults.standard.double(forKey: "imgCount")
        return Int(count)
    }
    
    func imagesToArray() {
        var tempCount = 0
        print("before loop")
        while tempCount < imgCount {
            print("recover img \(tempCount)")
            let imageToRecover = UserDefaults.standard.data(forKey: "\(tempCount)")
            if let possibleImageRecovered = imageToRecover {
                
            let imageRecovered = UIImage(data: possibleImageRecovered)
                arrayOfImg.append(imageRecovered!)
        }
            /*
        let possibleOldImagePath = UserDefaults.standard.string(forKey: "\(tempCount)")
        if let oldImagePath = possibleOldImagePath {
            let oldFullPath = self.documentsPathForFileName(name: oldImagePath)
            let oldImageData = NSData(contentsOfFile: oldFullPath)
            // here is your saved image:
            let oldImage = UIImage(data: oldImageData as! Data)
 */
            
        //}
            tempCount += 1
        }
    }
    
    




func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = theCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! SavedImageView
        cell.imageView.image = arrayOfImg[indexPath.item]
        
        return cell

    }

    
    //get full document path
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        let path = paths[0] as String;
        //let fullPath = path.stringByAppendingPathComponent(name)
        let fullPath = path.appending(name)
        
        return fullPath
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
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
