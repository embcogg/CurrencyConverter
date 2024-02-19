//
//  ConverterView.swift
//  CurrencyConverterCoggins
//
//  Created by Emily Coggins on 2/18/24.
//

import UIKit

class ConverterView: UIViewController {
    
    @IBOutlet weak var USDAmountLabel: UILabel!
    @IBOutlet weak var EURAmountLabel: UILabel!
    @IBOutlet weak var GBPAmountLabel: UILabel!
    @IBOutlet weak var CADAmountLabel: UILabel!
    @IBOutlet weak var CHFAmountLabel: UILabel!
    
    @IBOutlet weak var EAmount: UILabel!
    @IBOutlet weak var GAmount: UILabel!
    @IBOutlet weak var CAmount: UILabel!
    @IBOutlet weak var CHAmount: UILabel!
    
    var conversionResults: [String: Double] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateConversionLabels()
    }
    
    func updateConversionLabels() {
        EURAmountLabel.isHidden = true
        GBPAmountLabel.isHidden = true
        CADAmountLabel.isHidden = true
        CHFAmountLabel.isHidden = true
        
        EAmount.isHidden = true
        GAmount.isHidden = true
        CAmount.isHidden = true
        CHAmount.isHidden = true
        
        if let usdAmount = conversionResults["USD"] {
            USDAmountLabel.text = "$ \(formatCurrencyValue(usdAmount))"
        }
        
        if let euroAmount = conversionResults["EUR"] {
            EURAmountLabel.text = "€ \(formatCurrencyValue(euroAmount))"
            EURAmountLabel.isHidden = false
        }
        if let gbpAmount = conversionResults["GBP"] {
            GBPAmountLabel.text = "£ \(formatCurrencyValue(gbpAmount))"
            GBPAmountLabel.isHidden = false
        }
        if let cadAmount = conversionResults["CAD"] {
            CADAmountLabel.text = "C$ \(formatCurrencyValue(cadAmount))"
            CADAmountLabel.isHidden = false
        }
        if let chfAmount = conversionResults["CHF"] {
            CHFAmountLabel.text = "CHF \(formatCurrencyValue(chfAmount))"
            CHFAmountLabel.isHidden = false
        }
    }
    
    private func formatCurrencyValue(_ value: Double) -> String {
        return String(format: "%.2f", value)
    }
}

