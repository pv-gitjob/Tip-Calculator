//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Praveen V on 12/17/19.
//  Copyright © 2019 Praveen V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var dinersControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get and calculate values
        let bill = Double(billField.text!) ?? 0
        let tipPercent = Double(round(tipSlider.value*100))/100
        let tip = bill * tipPercent
        let total = bill + tip
        let diners = Double(dinersControl.selectedSegmentIndex + 1)
        let each = total / diners
        
        //Update UI accordingly
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        percentLabel.text = String(Int(tipPercent*100)) + "% Tip"
        eachLabel.text = String(format: "$%.2f", each)
    }
    
}

