//
//  WatchInterfaceController.swift
//  DecHex
//
//  Created by Toby Applegate on 10/11/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class WatchInterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var originalNumber: WKInterfaceLabel! //inputted by user
    @IBOutlet var decNumber: WKInterfaceLabel! //if converted original number to Dec
    @IBOutlet var hexNumber: WKInterfaceLabel! //if converted original number to Hex
    
    let dataSession = WCSession.defaultSession()
    
    override func awakeWithContext(context: AnyObject?) { //init interface controller with context data
        super.awakeWithContext(context)
        
        dataSession.delegate = self
        dataSession.activateSession() //watch app ready to recieve messages fomr iphone app
    }
    
    override func willActivate() { //ismilar to viewdidload
        super.willActivate()
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        let origNumToBeDisplayed = message["number"] as? String //message = dict of contents from message, as? = "number" might be nil but try to downcast to String type
        hexNumber.setText(origNumToBeDisplayed) //set text of hexNumber to original number enterd form iphone app
    }
    
    //wont send response message (thorugh .sendMessage) as this is test
    
    
    func displayOriginalNumber(origNumber : String) { //try to get data from phone using SharedSingleton class in SharedSingleton.swift file
            originalNumber.setText("\(origNumber)")
    }

}

//extension WatchInterfaceController: WCSessionDelegate {
//    
//}

