//
//  ViewController.swift
//  CurrencyConverterCoggins
//
//  Created by Emily Coggins on 2/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var euroSwitch: UISwitch! // Euro
    @IBOutlet weak var gbpSwitch: UISwitch! // Great Britain Pound
    @IBOutlet weak var cadSwitch: UISwitch! // Canadian Dollar
    @IBOutlet weak var chfSwitch: UISwitch! // Swiss Franc
    
    var converterLogic = ConverterLogic()
    var conversionResults: [String: Double] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func euroSwitchChanged(_ sender: UISwitch) {
        converterLogic.setSwitch(currency: "EUR", switchValue: sender.isOn)
    }
    
    @IBAction func gbpSwitchChanged(_ sender: UISwitch) {
        converterLogic.setSwitch(currency: "GBP", switchValue: sender.isOn)
    }
    
    @IBAction func cadSwitchChanged(_ sender: UISwitch) {
        converterLogic.setSwitch(currency: "CAD", switchValue: sender.isOn)
    }
    
    @IBAction func chfSwitchChanged(_ sender: UISwitch) {
        converterLogic.setSwitch(currency: "CHF", switchValue: sender.isOn)
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = textField.text, let amount = Double(amountText) else {
            presentAlertWithTitle("Error", message: "Invalid input. Please enter a number.")
            return
        }
        
        conversionResults["USD"] = amount

        if euroSwitch.isOn {
            conversionResults["EUR"] = converterLogic.getEuroConversion(amount)
        }
        if gbpSwitch.isOn {
            conversionResults["GBP"] = converterLogic.getGbpConversion(amount)
        }
        if cadSwitch.isOn {
            conversionResults["CAD"] = converterLogic.getCadConversion(amount)
        }
        if chfSwitch.isOn {
            conversionResults["CHF"] = converterLogic.getChfConversion(amount)
        }
        
        performSegue(withIdentifier: "toConversionResultsView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConversionResultsView" {
            if let destinationVC = segue.destination as? ConverterView {
                destinationVC.conversionResults = conversionResults
            }
        }
    }

    private func presentAlertWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}



