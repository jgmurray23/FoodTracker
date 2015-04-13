//
//  DetailViewController.swift
//  FoodTracker
//
//  Created by Joseph Murray on 2015-04-05.
//  Copyright (c) 2015 JoeCo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var usdaItem:USDAItem?
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    required init(coder aDecoder: NSCoder){
        
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usdaItemDidComplete:", name: kUSDAItemCompleted, object: nil )
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if usdaItem != nil {
            textView.attributedText = createAttributedString(usdaItem!)
        }
        

        
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func eatItBarButtonItemPressed(sender: UIBarButtonItem) {
    
    }
    
    
    
    func usdaItemDidComplete(notification: NSNotification ){
        
        println("usdaItemDidComplete in DetailVewController")
        usdaItem = notification.object as? USDAItem
        
        if self.isViewLoaded() && self.view.window != nil {
            textView.attributedText = createAttributedString(usdaItem!)
            
            
        }
        
    }
    
    func createAttributedString (usdaItem:USDAItem!) -> NSAttributedString {
        
        var itemAttributedString = NSMutableAttributedString()
        
        var centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = NSTextAlignment.Center
        centeredParagraphStyle.lineSpacing = 10.0
        
        var titleAttributesDictionary = [
            NSForegroundColorAttributeName:UIColor.blackColor(),
            NSFontAttributeName:UIFont.boldSystemFontOfSize(22.0),
            NSParagraphStyleAttributeName : centeredParagraphStyle
        ]
        
        let titleString = NSAttributedString(string:"\(usdaItem.name)\n", attributes:titleAttributesDictionary)
        
        itemAttributedString.appendAttributedString(titleString)
        
        var leftAllignedParagraphStyle = NSMutableParagraphStyle()
        leftAllignedParagraphStyle.alignment = NSTextAlignment.Left
        leftAllignedParagraphStyle.lineSpacing = 18.0
        
        var styleFirstWordAttributesDictionary = [
            NSForegroundColorAttributeName : UIColor.blackColor(),
            NSFontAttributeName : UIFont.boldSystemFontOfSize(16.0),
            NSParagraphStyleAttributeName : leftAllignedParagraphStyle]
        
        var style1AttributesDictionary = [
            NSForegroundColorAttributeName : UIColor.redColor(),
            NSFontAttributeName : UIFont.systemFontOfSize(16.0),
            NSParagraphStyleAttributeName : leftAllignedParagraphStyle]
        
        var style2AttributesDictionary = [
            NSForegroundColorAttributeName : UIColor.blueColor(),
            NSFontAttributeName : UIFont.systemFontOfSize(16.0),
            NSParagraphStyleAttributeName : leftAllignedParagraphStyle]
            
        let calciumTitleString = NSAttributedString(string: "Calcium ", attributes: styleFirstWordAttributesDictionary)
        let calciumBodyString = NSAttributedString(string: "\(usdaItem.calcium)% \n", attributes: style1AttributesDictionary)
        
        itemAttributedString.appendAttributedString(calciumTitleString)
        itemAttributedString.appendAttributedString(calciumBodyString)
        let carbohydrateTitleString = NSAttributedString(string: "Carbohydrate ", attributes: styleFirstWordAttributesDictionary)
        let carbohydrateBodyString = NSAttributedString(string: "\(usdaItem.carbohydrate)% \n", attributes: style2AttributesDictionary)
        itemAttributedString.appendAttributedString(carbohydrateTitleString)
        itemAttributedString.appendAttributedString(carbohydrateBodyString)
        let cholesterolTitleString = NSAttributedString(string: "Cholesterol ", attributes: styleFirstWordAttributesDictionary)
        let cholesterolBodyString = NSAttributedString(string: "\(usdaItem.cholesterol)% \n", attributes: style1AttributesDictionary)
        itemAttributedString.appendAttributedString(cholesterolTitleString)
        itemAttributedString.appendAttributedString(cholesterolBodyString)
        
        
        // Energy
        let energyTitleString = NSAttributedString(string: "Energy ", attributes: styleFirstWordAttributesDictionary)
        let energyBodyString = NSAttributedString(string: "\(usdaItem.energy)% \n", attributes: style2AttributesDictionary)
        itemAttributedString.appendAttributedString(energyTitleString)
        itemAttributedString.appendAttributedString(energyBodyString)
        
        // Fat Total
        let fatTotalTitleString = NSAttributedString(string: "FatTotal ", attributes: styleFirstWordAttributesDictionary)
        let fatTotalBodyString = NSAttributedString(string: "\(usdaItem.fatTotal)% \n", attributes: style1AttributesDictionary)
        itemAttributedString.appendAttributedString(fatTotalTitleString)
        itemAttributedString.appendAttributedString(fatTotalBodyString)
        
        // Protein
        let proteinTitleString = NSAttributedString(string: "Protein ", attributes: styleFirstWordAttributesDictionary)
        let proteinBodyString = NSAttributedString(string: "\(usdaItem.protein)% \n", attributes: style2AttributesDictionary)
        itemAttributedString.appendAttributedString(proteinTitleString)
        itemAttributedString.appendAttributedString(proteinBodyString)
        
        
        // Sugar
        let sugarTitleString = NSAttributedString(string: "Sugar ", attributes: styleFirstWordAttributesDictionary)
        let sugarBodyString = NSAttributedString(string: "\(usdaItem.sugar)% \n", attributes: style1AttributesDictionary)
        itemAttributedString.appendAttributedString(sugarTitleString)
        itemAttributedString.appendAttributedString(sugarBodyString)
        
        // Vitamin C
        let vitaminCTitleString = NSAttributedString(string: "Vitamin C ", attributes: styleFirstWordAttributesDictionary)
        
        let vitaminCBodyString = NSAttributedString(string: "\(usdaItem.vitaminC)% \n", attributes: style2AttributesDictionary)
        
        itemAttributedString.appendAttributedString(vitaminCTitleString)
        itemAttributedString.appendAttributedString(vitaminCBodyString)
        
        
        return itemAttributedString
        
    }
    
   
}

























