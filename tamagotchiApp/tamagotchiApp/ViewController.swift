//
//  ViewController.swift
//  tamagotchiApp
//
//  Created by Ahmed, Maheraj (HWTA) on 14/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tamagotchiStats: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tamagotchiStats = Tamagotchi()
        var tamagotchi: Tamagotchi?{
            tamagotchi?.tamagotchiStats()
        }
        
        // Do any additional setup after loading the view.
    }


}

