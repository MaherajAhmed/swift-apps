//
//  ViewController.swift
//  calculatorForRPN
//
//  Created by Ahmed, Maheraj (HWTA) on 09/06/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calcDisplay: UILabel!
    
    var operater:String = ""
    var sumOfNumbers:[Int] = []
    var answer:Int = 0
    var userTyped = false
    var calcFunc = CalculatorFunctionality()
    
    var calcDisplayValue: Int {
        
        get{
            return(NumberFormatter().number(from: calcDisplay.text!) as! Int)
        }
        set(newValue) {
            calcDisplay.text = "\(newValue)"
            
        }
    }
    
    @IBAction func enterPressed() {
        userTyped = false
        self.calcFunc.stack.append(calcDisplayValue)
    }
    
    @IBAction func evaluatingButton() {
        self.calcDisplay.text = String(answer)
    }
    
    @IBAction func changeOperation(_ sender: UIButton) {
        operater = sender.currentTitle!
        if userTyped {
            
            enterPressed()
        }
        answer = (self.calcFunc.operate(operater: operater))
        sumOfNumbers.append(answer)
        enterPressed()
        print(answer)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        calcDisplay.text = "\(0)"
        self.calcFunc.stack.removeAll()
        userTyped = false
    }
        
    @IBAction func digitPressed(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userTyped {
            calcDisplay.text = (calcDisplay.text ?? "0") + digit
        } else {
            calcDisplay.text = digit
            userTyped = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.calcFunc = CalculatorFunctionality()
    }
    
}

