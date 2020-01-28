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
    var ageTimer: Timer?
    var timeRemaining = Int.random(in: 40...60)
    var ageTimeRemaining = 3600
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStats.text = tamagotchi?.tamagotchiStats()
            
        }
    }

    @IBOutlet var remainingTimeDisplay: UILabel!
    @IBOutlet var tamagotchiStats: UILabel!
    @IBOutlet var hangOut: UIButton!
    @IBOutlet var takeToToilet: UIButton!
    @IBOutlet var feed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
        ageTimer = Timer.scheduledTimer(timeInterval: 3600, target: self, selector:#selector (ageCountdown), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector (countdown), userInfo: nil, repeats: true)
    }
        
    
    @objc func ageCountdown() {
        if ageTimeRemaining > 0 {
            ageTimeRemaining -= 1
            tamagotchi?.age = ageTimeRemaining
            tamagotchiStats.text = tamagotchi?.tamagotchiStats()
            
        }
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

    @IBAction func timeTillToilet(_ sender: Any) {
     tamagotchi?.takeToToilet()
     tamagotchiStats.text = tamagotchi?.tamagotchiStats()
    }
    
    
    @IBAction func hangOut(_ sender: Any) {
        tamagotchi?.hangOut()
        tamagotchiStats.text = tamagotchi?.tamagotchiStats()
    }
    
    
    @IBAction func feed(_ sender: Any) {
        tamagotchi?.feed()
        tamagotchiStats.text = tamagotchi?.tamagotchiStats()
    }
    
            
    
        
        
        // Do any additional setup after loading the view.
    }



