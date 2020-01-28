//
//  stackDataStructure.swift
//  visualisingDataStructures
//
//  Created by Ahmed, Maheraj (HWTA) on 28/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class StackDataStructure {
    
    var stack = Array(repeating: 0, count: 5)
    var top = -1
    
    func push(item:Int) {
        if top > stack.count {
            print("Stack is now full")
        } else {
            top += 1
            stack[top] = item
        }
    }
    
    func pop() -> Int? {
        if top <= -1 {
            print ("No items in stack")
            return nil
        }
        else {
            let item = stack[top]
            top -= 1
            return item
        }
    }
    

    
}
