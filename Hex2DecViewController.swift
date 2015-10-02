//
//  Hex2DecViewController.swift
//  DecHex
//
//  Created by Toby Applegate on 01/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import UIKit

class Hex2DecViewController: UIViewController {

    var brain = ConverterBrain()
    
    

    @IBOutlet weak var answerDisplay: UILabel!
    @IBOutlet weak var hexInput: UITextField!
    @IBAction func convertButton(sender: UIButton) {
        convert(hexInput.text!)
    }
    
    func convert(input : String) {
        print(input)
        let convertedNumber = brain.hexToDec(input)
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
    

}
