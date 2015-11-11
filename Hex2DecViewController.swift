//
//  Hex2DecViewController.swift
//  DecHex
//
//  Created by Toby Applegate on 01/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import UIKit

class Hex2DecViewController: UIViewController {
    var memory = SharedSingleton()
    var brain = ConverterBrain()

    @IBOutlet weak var answerDisplay: UILabel!
    @IBOutlet weak var hexInput: UITextField!
    @IBAction func convertButton(sender: UIButton) {
        memory.originalNumber = "\(hexInput.text)"
        convert(hexInput.text!)
    }
    
    func convert(input : String) {
        print(input)
        let convertedNumber = brain.hexToDec(input)
        if let answer = convertedNumber.result {
            print("The answer is \(answer)")
            let stringOfAnswer = String(answer)
            answerDisplay.text = stringOfAnswer
            memory.newDecNumber = stringOfAnswer
        }
        else if let message = convertedNumber.errorMessage {
            print("The answer is \(message)")
            let errorMessage = "\(message)"
            memory.newDecNumber = errorMessage
            answerDisplay.text = errorMessage
    }
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
