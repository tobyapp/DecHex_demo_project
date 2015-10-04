//
//  ConverterBrain.swift
//  DecHex
//
//  Created by Toby Applegate on 01/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import Foundation

class ConverterBrain {
    
    func hexToDec(hexNumber : String) -> (result: Int?, errorMessage: String?) {
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
            case  "G", "g", "H", "h", "I", "i", "J", "j", "K", "k", "L", "l", "M", "m", "N",
            "n", "O", "o", "P", "p", "Q", "q", "R", "r", "S", "s", "T", "t", "U", "u", "V", "v", "W", "w", "X", "x", "Y", "y", "Z", "z":
                return(nil, "ERROR - inputted incorrect hex value")
            default:
                break
            }
            let powerOf: Int = Int(pow(Double(16),Double(power)))
            total = total + (Int(numberString)! * powerOf)
            power++
        }
        return(total, nil)
    }
    
    
    func decToHex(decNumber : Int) -> Int {
        var counter = 0
        //var hexArray : [Array]<>
        var result = decNumber
        while result != 0 {
            result % 4
        }
        
        
        
    
        //for index to decNumber {
            
            
        //}
        
        
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        
        return(5)
        
    }
    
    
    
    
    
    
    
    
    
}
