//
//  Dec2HexViewController.swift
//  DecHex
//
//  Created by Toby Applegate on 04/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import UIKit
import WatchConnectivity

class Dec2HexViewController: UIViewController, WCSessionDelegate {
    var memory = SharedSingleton() //tried to share data to watch through this class
    var brain = ConverterBrain()
    let dataSession = WCSession.defaultSession()
    
    @IBAction func warningmessage(sender: AnyObject) { //testing alertController
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
        print("done with alert controller")
    }
    
    @IBOutlet weak var answerDisplay: UILabel!
    @IBOutlet weak var decInput: UITextField!
    @IBAction func convert(sender: UIButton) {
        memory.originalNumber = "\(decInput.text)" //testing shared data through sharedsingleton class
        convertDecToHex(decInput.text!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataSession.delegate = self
        dataSession.activateSession() //ready to reciev messages from counterpart (may not be nessassery as not sending messages back)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertDecToHex(decInput : String) {
        print(decInput)
        let convertedNumber = brain.decToHex(decInput)
        print("The answer is \(convertedNumber)")
        
        let stringOfConvertedNumber = String(convertedNumber) //testing shared data through sharedsingleton class
        memory.newHexNumber = stringOfConvertedNumber //testing shared data through sharedsingleton class
        
        answerDisplay.text = stringOfConvertedNumber
        
        let message = [ "number": stringOfConvertedNumber ]
        dataSession.sendMessage(message, replyHandler: nil, errorHandler: nil)
        //replyhandler set to nil as dont want to recieve reply, same with erorr handler
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
