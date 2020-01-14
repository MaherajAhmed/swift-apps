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
}
