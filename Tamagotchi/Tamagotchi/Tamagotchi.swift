//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Ahmed, Maheraj (HWTA) on 22/11/2019.
//  Copyright © 2019 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class Tamagotchi {
    var sleepLevel: Int = 50
    var age: Int = 5
    var name = "Tam"
    var health = true
    var happiness = "happy"
    var hunger = "Hungry"
    var discipline: String = "well-behaved"
    
    func eatsnack(inputData: Int) -> Int {
        var weight = 0
        let initialWeight = inputData
        if initialWeight > 5 {
            health = false
            if health == false {
                print("Your Tamogotchi is currently underweight. Feed.")
                weight = initialWeight + 1
                return weight
            }
        }
    }
    
    func sleep() {
        while sleepLevel > 50 {
            if sleepLevel<=5 {
                print ("Tamagotchi can no longer stay awake. Night Night")
                sleepLevel = sleepLevel + 1
                } else {
                print ("Tamagotchi does not need to sleep")
                sleepLevel = sleepLevel - 1
            }
        return
        }
    }
    
    func play() {
        return
    }
    
    func beep() {
        return
    }
    
    func Discipline() {
        return
    }
    

}
