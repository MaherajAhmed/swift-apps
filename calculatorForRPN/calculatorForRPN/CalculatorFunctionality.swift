//
//  CalculatorFunctionality.swift
//  calculatorForRPN
//
//  Created by Ahmed, Maheraj (HWTA) on 10/06/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation
import UIKit


class CalculatorFunctionality: NSObject {
    
    var stack:[Int] = []
    
    func updateStackWith(value: Int) {
        self.stack.append(value)
    }
    
    func operate(operater: String) -> Int {
        
        switch operater {
        case "+":
            if stack.count >= 2 {
               return self.stack.removeLast() + self.stack.removeLast()
            }
        case "×":
            if stack.count >= 2 {
                return self.stack.removeLast() * self.stack.removeLast()
            }
        case "÷":
            if stack.count >= 2 {
                if self.stack.first == 0 || self.stack.last == 0 {
                    return 0
                } else {
                    return self.stack.removeFirst() / self.stack.removeLast()
                }
            }
        case "-":
            if stack.count >= 2 {
                return self.stack.removeFirst() - self.stack.removeLast()
            }
        
        default: break
        }
        return 0
    }
    
    func switchOperator(operater: String) -> String {
        switch operater {
        case "+":
            let operater = "-"
        case "-":
            let operater = "+"
        default:
            return operater
        }
        return operater
    }

}
