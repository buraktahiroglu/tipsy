//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip : Double = 0.1
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let tipText = sender.currentTitle ?? "Error"
        let tipTextDropped = tipText.dropLast()
        tip = Double(tipTextDropped)!/100
        billTextField.endEditing(true)
        }
      

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.stepValue = 1
        sender.minimumValue = 1
        sender.maximumValue = 200
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let cost = Double(billTextField.text!)!
        print(cost*(1+tip)/stepper.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = 2
        splitNumberLabel.text = "2"
        // Do any additional setup after loading the view.
    }


}

