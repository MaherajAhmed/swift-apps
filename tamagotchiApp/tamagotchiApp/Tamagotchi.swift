//
//  Tamagotchi.swift
//  tamagotchiApp
//
//  Created by Ahmed, Maheraj (HWTA) on 14/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    var name: String = "Tamagotchi"
    var age: Int = 0
    var mood: String = "Happy"
    var timeTillToilet: Int = 60
    var health: Int = 5
    var death: String = ""
    
    func tamagotchiStats() -> String {
        return """
        Name: \(name)
        Age: \(age)
        Mood: \(mood)
        How long can it hold: \(timeTillToilet)
        Health: \(health)
        """
    }
    
    func takeToToilet() {
        if timeTillToilet < 60 {
            timeTillToilet += Int.random(in: 20...60)
        }
    }
    
    func hangOut() {
        let randomInteger = Int.random(in: 1...3)
        switch randomInteger {
        case 1:
            mood = "Happy"
        case 2:
            mood = "Sad"
        case 3:
            mood = "Frustrated"
        default:
            mood = "happy"
        }
    }
    
    func feed() {
        if health < 5 {
            health += 1
            
        } else if health < 10 {
            health = 0
        }
        
        if health == 0 {
            
        }
            
        
    }
}

