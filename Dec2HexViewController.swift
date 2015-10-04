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
