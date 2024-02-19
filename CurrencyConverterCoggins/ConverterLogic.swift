//
//  ConverterLogic.swift
//  CurrencyConverterCoggins
//
//  Created by Emily Coggins on 2/18/24.
//

struct ConverterLogic {
    var euroRate: Double = 0.82
    var gbpRate: Double = 0.71
    var cadRate: Double = 1.26
    var chfRate: Double = 0.88
    
    var euroSwitch = true
    var gbpSwitch = true
    var cadSwitch = true
    var chfSwitch = true

    var amount: Double = 0
    
    mutating func setSwitch(currency: String, switchValue: Bool) {
        switch currency {
        case "EUR":
            euroSwitch = switchValue
        case "GBP":
            gbpSwitch = switchValue
        case "CAD":
            cadSwitch = switchValue
        case "CHF":
            chfSwitch = switchValue
        default:
            break
        }
    }
    
    //Method to Convert USD to EURO
    mutating func getEuroConversion(_ amount: Double) -> Double {
        return amount * euroRate
    }
    
    // Method to Convert USD to GBP
    mutating func getGbpConversion(_ amount: Double) -> Double {
        return amount * gbpRate
    }
    
    // Method to Convert USD to CAD
    mutating func getCadConversion(_ amount: Double) -> Double {
        return amount * cadRate
    }
    
    // Method to Convert USD to CHF
    mutating func getChfConversion(_ amount: Double) -> Double {
        return amount * chfRate
    }
    
    // Method to convert the USD amount to selected currencies
    mutating func convertAmount(_ amount: Double) -> [String: Double] {
        var conversionResults: [String: Double] = [:]
        
        if euroSwitch {
            conversionResults["EUR"] = getEuroConversion(amount)
        }
        if gbpSwitch {
            conversionResults["GBP"] = getGbpConversion(amount)
        }
        if cadSwitch {
            conversionResults["CAD"] = getCadConversion(amount)
        }
        if chfSwitch {
            conversionResults["CHF"] = getChfConversion(amount)
        }
        
        return conversionResults
    }
}

