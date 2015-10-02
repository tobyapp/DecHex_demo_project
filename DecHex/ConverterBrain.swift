//
//  ConverterBrain.swift
//  DecHex
//
//  Created by Toby Applegate on 01/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import Foundation

class ConverterBrain {
    
    func hexToDec(hexNumber : String) -> Int {
        var power = 0
        var total = 0
        let hexString = Array(hexNumber.characters.reverse())
        
        for number in hexString {
            var numberString = String(number)
            
            switch numberString {
            case "A", "a":
                numberString = "10"
            case "B", "b":
                numberString = "11"
            case "C", "c":
                numberString = "12"
            case "D", "d":
                numberString = "13"
            case "E", "e":
                numberString = "14"
            case "F", "f":
                numberString = "15"
            default:
                break
            }
            let powerOf: Int = Int(pow(Double(16),Double(power)))
            total = total + (Int(numberString)! * powerOf)
            power++
        }
        return(total)
    }
    
    func dexToHex(decNumber : Int) -> String{
        return("5")
        
    }
    
    
    
    
    
    
    
    
    
}
