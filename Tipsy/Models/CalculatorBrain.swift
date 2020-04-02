//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Mehmet Eroğlu on 2.04.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bill = Bill(tip: 0.10, numberOfPeople: 2, billTotal: 0.0, finalResult: "0.0")
    
    mutating func getTip(stringTip: String) {
        let tipMinusPercentSign = String(stringTip.dropLast())
        let tipAsANumber = Double(tipMinusPercentSign)!
        bill.tip = tipAsANumber / 100
    }
    
    mutating func getNumberOfPeople(numberOfPeople: Double) {
        bill.numberOfPeople = Int(numberOfPeople)
    }
    
    mutating func calculateFinalResult(billTotalString: String) {
        if billTotalString != "" {
            bill.billTotal = Double(billTotalString)!
            let result = bill.billTotal * (1 + bill.tip) / Double(bill.numberOfPeople)
            bill.finalResult =  String(format: "%.2f", result)
        }
    }
    
    func getFinalResult() -> String {
        return bill.finalResult
    }
    
    func getTipAsInt() -> Int {
        return Int(bill.tip*100)
    }
    
    func getNumberOfPeople() -> Int {
        return bill.numberOfPeople
    }
}
