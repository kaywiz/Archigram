//
//  StyleViewController.swift
//  Archigram
//
//  Created by Jack Crawford on 4/10/17.
//  Copyright © 2017 Jack Crawford. All rights reserved.
//

import UIKit

@objc class StyleViewController: UIViewController {
    
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var tagDisplay: UILabel!
    @IBOutlet weak var nameDisplay: UILabel!
    @IBOutlet weak var timePeriodDisplay: UILabel!
    
    var imageToAnalyze: UIImage!
    var tagText: String!
    var arrayOfTags: NSMutableArray!
    
    
    @IBOutlet var questionView: UIView!
    
    @IBOutlet var wikiView: UIWebView!
    var isWiki = false
    @IBOutlet var wikiLabel: UIButton!
    var url = "https://en.wikipedia.org/wiki/"
    
    var inputArray = ["architecture", "house", "building", "home", "facade", "brick", "old", "outdoors", "mansion", "lawn", "window", "exterior", "family", "city", "town", "sky", "street", "front", "urban"]
    
    var beauxArtsArray = ["administration", "museum", "ancient", "parliament", "sculpture", "statue", "facade", "landmark", "monument", "castle", "travel", "old"]
    var imptBeauxArtsArray = ["administration", "museum", "ancient", "facade"]
    
    var federalArray = ["traditional", "brick", "historic", "church", "religion", "old", "window", "town", "house", "home", "administration", "facade"]
    var imptFederalArray = ["traditional", "brick", "historic", "house", "home", "facade"]
    
    var gothicArray = ["church", "cathedral", "religion", "Gothic", "travel", "goth like", "tourism", "tourist", "monument", "ancient", "religious", "castle", "tower", "landmark"]
    var imptGothicArray = ["church", "cathedral", "religion", "Gothic", "castle", "tourism"]
    
    var renaissanceRevivalArray = ["castle", "old", "travel", "imperial", "tower", "chateau", "tourism", "ancient", "park", "landmark", "historic", "facade", "town"]
    var imptRenaissanceRevealArray = ["castle", "old", "travel", "tourism", "town"]
    
    var prairieSchoolArray = ["wood", "house", "family", "home", "horizontal plane", "roof", "wooden", "lawn", "window", "grass", "urban", "city"]
    var imptPrairieSchoollArray = ["wood", "house", "family", "home", "city"]
    
    var modernismArray = ["modern", "contemporary", "window", "lawn", "luxury", "grass", "business", "summer", "glass items", "steel", "museum"]
    var imptModernismArray = ["modern", "contemporary", "window", "museum"]
    
    var brutalismArray = ["modern", "business", "window", "headquarters", "office", "contemporary", "futuristic", "apartment", "glass items", "urban"]
    var imptBrutalismArray = ["modern", "business", "window", "office"]
    
    var blobitectureArray = ["glass items", "futuristic", "expression", "sculpture", "art", "technology", "water", "reflection", "city", "urban", "modern"]
    var imptBlobitectureArray = ["glass items", "expression", "city", "urban", "museum", "tourism"]
    
    var resultArray = [String]()
    
    
    //@IBOutlet weak var analyzedPhoto: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageDisplay.image = imageToAnalyze
        tagDisplay.text = tagText
        
        if isWiki == false{
            wikiView.isHidden = true
        }
        else{
            wikiView.isHidden = false
        }
        
        
        compareBeauxArts()
        compareFederal()
        compareGothic()
        compareRenaissanceRevival()
        comparePrairieSchool()
        compareModernism()
        compareBrutalism()
        compareBlobitecture()
        for element in resultArray {
            print("Entered")
            if resultArray.count == 0 {
                nameDisplay.text = ""
                timePeriodDisplay.text = ""
                tagDisplay.text = "We are unable to detact the architectural style."
            }
            if resultArray[0] == "Beaux-Arts" {
                questionView.isHidden = true
                nameDisplay.text = "Beaux-Arts"
                timePeriodDisplay.text = "1780 and 1830"
                tagDisplay.text = "Beaux-Arts architecture (/ˌboʊˈzɑːr/; French: [bozaʁ]) expresses the academic neoclassical architectural style taught at the École des Beaux-Arts in Paris. Beaux-Arts architecture depended on sculptural decoration along conservative modern lines, employing French and Italian Baroque and Rococo formulas combined with an impressionistic finish and realism."
            }
            if resultArray[0] == "Federal" {
                questionView.isHidden = true
                nameDisplay.text = "Federal"
                timePeriodDisplay.text = "1890 to 1920"
                tagDisplay.text = "Federal-style architecture is the name for the classicizing architecture built in the newly founded United States between c. 1780 and 1830, and particularly from 1785 to 1815. American Federal architecture typically uses plain surfaces with attenuated detail, usually isolated in panels, tablets, and friezes. It also had a flatter, smoother façade and rarely used pilasters."
            }
            if resultArray[0] == "Gothic" {
                questionView.isHidden = true
                nameDisplay.text = "Gothic"
                timePeriodDisplay.text = "1100s to 1500s"
                tagDisplay.text = "Gothic architecture is a style of architecture that flourished in Europe during the high and late medieval period. It evolved from Romanesque architecture and was succeeded by Renaissance architecture. Its characteristics include the pointed arch, the ribbed vault (which evolved from the joint vaulting of romanesque architecture) and the flying buttress."
            }
            if resultArray[0] == "Renaissance Revival" {
                questionView.isHidden = true
                nameDisplay.text = "Renaissance Revival"
                timePeriodDisplay.text = "1840 to 1920"
                tagDisplay.text = "Renaissance Revival is an all-encompassing designation that covers many 19th century architectural revival styles. Buildings with the first Renaissance Revival Style show a definite studied formalism. The tightly contained cube is a symmetrical composition of early sixteenth century Italian elements. Scale and size distinguish the later Revival from the earlier Renaissance Revival."
            }
            if resultArray[0] == "Prairie School" {
                questionView.isHidden = true
                nameDisplay.text = "Prairie School"
                timePeriodDisplay.text = "Late 19th- and early 20th-century"
                tagDisplay.text = "Prairie School was the most common to the Midwestern United States. The style is usually marked by horizontal lines, flat or hipped roofs with broad overhanging eaves, windows grouped in horizontal bands, integration with the landscape, solid construction, craftsmanship, and discipline in the use of ornament."
            }
            if resultArray[0] == "Modernism" {
                questionView.isHidden = true
                nameDisplay.text = "Modernism"
                timePeriodDisplay.text = "Mid 20th-century to present"
                tagDisplay.text = "Modern architecture emerged in the first half of the 20th century and became dominant after World War II. It was based upon new technologies of construction, particularly the use of glass, steel and reinforced concrete; and upon a rejection of the traditional neoclassical architecture and Beaux-Arts styles that were popular in the 19th century"
            }
            if resultArray[0] == "Brutalism" {
                questionView.isHidden = true
                nameDisplay.text = "Brutalism"
                timePeriodDisplay.text = "1950s to mid-1970s"
                tagDisplay.text = "Brutalist architecture is a movement in architecture that flourished from the 1950s to the mid-1970s, descending from the modernist architectural movement of the early 20th century. Examples of Brutalist buildings are typically massive in character, fortress-like, with a predominance of exposed concrete construction, or ruggedly combine detailed brickwork and concrete."
            }
            if resultArray[0] == "Blobitecture" {
                questionView.isHidden = true
                nameDisplay.text = "Blobitecture"
                timePeriodDisplay.text = "Mid 1990s to present"
                tagDisplay.text = "Blobitecture is a movement in architecture in which buildings have an organic, amoeba-shaped, building form. The word is often used to describe buildings with curved and rounded shapes."
            }
                
                
            else {
                print("The architectural style is ", element + ".\n", terminator: " ")
            }
        }
        switch resultArray[0] {
        case "Beaux-Arts":
            url += "Beaux_Arts_architecture"
        case "Federal":
            url += "Federal_architecture"
        case "Gothic":
            url += "Gothic_architecture"
        case "Renaissance Revival":
            url += "Renaissance_Revival_architecture"
        case "Prairie School":
            url += "Prarie_School"
        case "Modernism":
            url += "Modern_architecture"
        case "Brutalism":
            url += "Brutalism"
        case "Blobitecture":
            url += "Blobitecture"
        default:
            url += ""
        }
        
    }
    
    func compareBeauxArts () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptBeauxArtsArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in beauxArtsArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Beaux-Arts")
        }
    }
    
    func compareFederal () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptFederalArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in federalArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Federal")
        }
        
    }
    
    func compareGothic () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptGothicArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in gothicArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Gothic")
        }
    }
    
    func compareRenaissanceRevival () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptRenaissanceRevealArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in renaissanceRevivalArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Renaissance Revival")
        }
    }
    
    func comparePrairieSchool () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptPrairieSchoollArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in prairieSchoolArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Prarie School")
        }
    }
    
    func compareModernism () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptModernismArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in modernismArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Modernism")
        }
    }
    
    func compareBrutalism () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptBrutalismArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in brutalismArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Brutalism")
        }
    }
    
    
    func compareBlobitecture () {
        var imptCount = 0
        var count = 0
        
        for i in arrayOfTags{
            let resultString = String(describing: i)
            for x in imptBlobitectureArray {
                if x == resultString {
                    imptCount += 1
                }
            }
            for x in blobitectureArray{
                if x == resultString {
                    count += 1
                }
            }
        }
        if imptCount >= 2 && count >= 4 {
            resultArray.append("Blobitecture")
        }
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
        questionView.isHidden = false;
        url = "https://en.wikipedia.org/wiki/"
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let photoSave = imageDisplay.image {
            UIImageWriteToSavedPhotosAlbum(photoSave, nil, nil, nil)
        }
    }
    
    @IBAction func wiki(_ sender: Any) {
        if (isWiki == false){
            isWiki = true
            wikiView.isHidden = false
            wikiLabel.setTitle("Close Wikipedia",for: .normal)
            let requestURL = NSURL(string:url)
            let request = NSURLRequest(url: requestURL! as URL)
            wikiView.loadRequest(request as URLRequest)
        }
        else{
            isWiki = false
            wikiView.isHidden = true
            wikiLabel.setTitle("Wikipedia",for: .normal)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
