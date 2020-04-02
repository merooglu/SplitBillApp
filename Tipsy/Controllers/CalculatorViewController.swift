//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        calculatorBrain.getTip(stringTip: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculatorBrain.getNumberOfPeople(numberOfPeople: sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculatorBrain.calculateFinalResult(billTotalString: billTextField.text ?? "0.0")
        self.performSegue(withIdentifier: "ResultsViewController", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsViewController" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.getFinalResult()
            destinationVC.tip = calculatorBrain.getTipAsInt()
            destinationVC.split = calculatorBrain.getNumberOfPeople()
        }
    }
}

