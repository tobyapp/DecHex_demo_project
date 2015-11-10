//
//  Dec2HexViewController.swift
//  DecHex
//
//  Created by Toby Applegate on 04/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import UIKit

class Dec2HexViewController: UIViewController {

    var brain = ConverterBrain()
    
    @IBAction func warningmessage(sender: AnyObject) {
                        let alertController = UIAlertController(
                            title: "test title, hey that they both start with a 'T'",
                            message: "shouldnt have pressed this button...",
                            preferredStyle: .Alert)
                        let cancelAction = UIAlertAction(
                            title: "meh",
                            style: UIAlertActionStyle.Destructive,
                            handler: nil)
                        let otherAction = UIAlertAction(
                            title: "other",
                            style: UIAlertActionStyle.Default,
                            handler: {action in print("confirm was tapped")})
                        alertController.addAction(cancelAction)
        alertController.addAction(otherAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .Default) { (action) in
            if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        alertController.addAction(openAction)

        
                            self.presentViewController(alertController, animated: true, completion: nil)
                    
                            print("done")
        
    }
    @IBOutlet weak var answerDisplay: UILabel!
    @IBOutlet weak var decInput: UITextField!
    @IBAction func convert(sender: UIButton) {
        convertDecToHex(decInput.text!)
    }
    
    func convertDecToHex(decInput : String) {
        print(decInput)
        let convertedNumber = brain.decToHex(decInput)
        print("The answer is \(convertedNumber)")
        answerDisplay.text = String(convertedNumber)
        
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
