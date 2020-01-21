//
//  ViewController.swift
//  tamagotchiApp
//
//  Created by Ahmed, Maheraj (HWTA) on 14/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer?
    var timeRemaining = Int.random(in: 40...60)
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStats.text = tamagotchi?.tamagotchiStats()
            
        }
    }

    @IBAction func timeTillToilet(_ sender: Any) {
           tamagotchi?.takeToToilet()
       }

    @IBOutlet var remainingTimeDisplay: UILabel!
    @IBOutlet var tamagotchiStats: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector (countdown), userInfo: nil, repeats: true)
    }
        
        
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            tamagotchi?.timeTillToilet = timeRemaining
            tamagotchiStats.text = tamagotchi?.tamagotchiStats()
        } else {
            timer?.invalidate()
              }
    }

            
    
        
        
        // Do any additional setup after loading the view.
    }



