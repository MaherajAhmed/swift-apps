//
//  ViewController.swift
//  CustomCar
//
//  Created by Ahmed, Maheraj (HWTA) on 10/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var carStatistics: UILabel!
    
    var car = Car(make: "Mazda", model: "MX-5", topSpeed: 100, acceleration: 7.5, handling: 3)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carStatistics.text = car.displayStats()
    }
}

