//
//  ViewController.swift
//  CustomCar
//
//  Created by Ahmed, Maheraj (HWTA) on 10/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var engineUpgrade: UISwitch!
    @IBOutlet var tiresAndSuspension: UISwitch!
    @IBOutlet var littleBitOfEverything: UISwitch!
    @IBOutlet var needForSpeed: UISwitch!
    @IBOutlet var sawft: UISwitch!
    
    @IBOutlet var carStatistics: UILabel!
    @IBOutlet var remainingFundsDisplay: UILabel!
    
    var remainingFunds = 1000 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[currentCarIndex]
        remainingFundsDisplay.text = "Remaining Funds \(remainingFunds)"
    }
    
    @IBAction func nextCar(_ sender: Any) {
        currentCarIndex += 1
        if currentCarIndex >= starterCars.cars.count {
            currentCarIndex = 0
        }
        car = starterCars.cars[currentCarIndex]
        
    }
    
    @IBAction func engineUpgradeToggle(_ sender: Any) {
        if engineUpgrade.isOn {
            car?.topSpeed += 20
            remainingFunds -= 500
        } else {
        car?.topSpeed -= 20
        remainingFunds += 500
            }
        if (remainingFunds - 500) < 0 && (tiresAndSuspension.isOn == false) {
            tiresAndSuspension.isEnabled = false
        } else {
            tiresAndSuspension.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (littleBitOfEverything.isOn == false ) {
            littleBitOfEverything.isEnabled = false
        } else {
            littleBitOfEverything.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (needForSpeed.isOn == false) {
            needForSpeed.isEnabled = false
        } else {
            needForSpeed.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (sawft.isOn == false) {
            sawft.isEnabled = false
        } else {
            sawft.isEnabled = true
        }
        
}
    
    @IBAction func tiresAndSuspensionToggle(_ sender: Any) {
        if tiresAndSuspension.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
        if (remainingFunds - 500) < 0 && (engineUpgrade.isOn == false) {
            engineUpgrade.isEnabled = false
        } else {
            engineUpgrade.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (littleBitOfEverything.isOn == false ) {
            littleBitOfEverything.isEnabled = false
        } else {
            littleBitOfEverything.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (needForSpeed.isOn == false) {
            needForSpeed.isEnabled = false
        } else {
            needForSpeed.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (sawft.isOn == false) {
            sawft.isEnabled = false
        } else {
            sawft.isEnabled = true
        }
    }
    
    @IBAction func littleBitOfEverythingToggle(_ sender: Any) {
        if littleBitOfEverything.isOn {
            car?.topSpeed += 2
            car?.acceleration -= 0.5
            car?.handling += 1
            remainingFunds -= 1000
        } else {
            car?.topSpeed -= 2
            car?.acceleration += 0.5
            car?.handling -= 1
            remainingFunds += 1000
        }
        if (remainingFunds - 500) < 0 && (engineUpgrade.isOn == false) {
            engineUpgrade.isEnabled = false
        } else {
            engineUpgrade.isEnabled = true
        }
        if (remainingFunds - 500) < 0 && (tiresAndSuspension.isOn == false) {
            tiresAndSuspension.isEnabled = false
        } else {
                tiresAndSuspension.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (needForSpeed.isOn == false) {
            needForSpeed.isEnabled = false
        } else {
            needForSpeed.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (sawft.isOn == false) {
            sawft.isEnabled = false
        } else {
            sawft.isEnabled = true
        }
    }
    
    @IBAction func needForSpeedToggle(_ sender: Any) {
        if needForSpeed.isOn {
            car?.topSpeed += 40
            remainingFunds -= 1000
        } else {
            car?.topSpeed -= 40
            remainingFunds += 1000
        }
        if (remainingFunds - 500) < 0 && (engineUpgrade.isOn == false) {
            engineUpgrade.isEnabled = false
        } else {
            engineUpgrade.isEnabled = true
        }
            if (remainingFunds - 500) < 0 && (tiresAndSuspension.isOn == false) {
            tiresAndSuspension.isEnabled = false
            } else {
                tiresAndSuspension.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (littleBitOfEverything.isOn == false ) {
            littleBitOfEverything.isEnabled = false
        } else {
            littleBitOfEverything.isEnabled = true
        }
        if (remainingFunds - 1000) < 0 && (sawft.isOn == false) {
            sawft.isEnabled = false
        } else {
            sawft.isEnabled = true
        }
    }
    
    @IBAction func sawftToggle(_ sender: Any) {
        if sawft.isOn {
            car?.handling += 3
            remainingFunds -= 1000
        } else {
            car?.handling -= 3
            remainingFunds += 1000
        }
        if (remainingFunds - 500) < 0 && (engineUpgrade.isOn == false) {
                   engineUpgrade.isEnabled = false
        } else {
            engineUpgrade.isEnabled = true
            }
        if (remainingFunds - 500) < 0 && (tiresAndSuspension.isOn == false) {
            tiresAndSuspension.isEnabled = false
        } else {
            tiresAndSuspension.isEnabled = true
            }
        if (remainingFunds - 1000) < 0 && (littleBitOfEverything.isOn == false ) {
            littleBitOfEverything.isEnabled = false
        } else {
            littleBitOfEverything.isEnabled = true
            }
        if (remainingFunds - 1000) > 0 && (needForSpeed.isOn == false) {
            needForSpeed.isEnabled = false
        } else {
            needForSpeed.isEnabled = true
               }
    }
    
    var currentCarIndex = 0
    var starterCars = StarterCars()
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
            
        }
    }

}

