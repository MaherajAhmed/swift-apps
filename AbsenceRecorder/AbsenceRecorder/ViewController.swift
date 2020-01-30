//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 30/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var divisions: [Division] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //iterate over every division
        //for each division, output its name and the number of students in it to the console
        //for each division,output each of its students
        
    
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
    }


}

