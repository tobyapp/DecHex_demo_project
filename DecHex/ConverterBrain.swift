//
//  ConverterBrain.swift
//  DecHex
//
//  Created by Toby Applegate on 01/10/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import Foundation

class ConverterBrain {
    var memory = SharedSingleton()
    
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
    
    
    func decToHex(decNumber : String) -> String {
        if let decNumber2 = Int(decNumber) {
        var x = decNumber2
        var y = decNumber2
        var z = ""
        while y != 0 {
            x = y % 16
            y = y / 16
            switch x {
            case 10:
                z = z + "A"
            case 11:
                z = z + "B"
            case 12:
                z = z + "C"
            case 13:
                z = z + "D"
            case 14:
                z = z + "E"
            case 15:
                z = z + "F"
            default:
                z = z + String(x)
            }
        }
        let zReversed = z.characters.reverse()
        print(String(zReversed))
        return(String(zReversed))
    }
    
    else {
    return("Error cannot convert to int")
    }
    }
    
    
    
    
    
    
    
    
}
