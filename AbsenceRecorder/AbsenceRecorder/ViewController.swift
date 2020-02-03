//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 30/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDummyData()
        for division in divisions {
            print ("Code: \(division.code),Number: \(division.studentsInDiv.count)")
            for student in division.studentsInDiv {
                print (" \(student.forename)")
            }
        }
        
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbsenceViewController") as? DivisionAbsenceViewController else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        
        vc.division = divisions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        }
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding:  .day, value: 1, to: currentDate) ?? Date()
               updateDateDisplay()
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding:  .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func updateDateDisplay () {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vBY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "HCV-2", of: 9))
        divisions.append(DivisionFactory.createDivision(code: "CX-2", of: 12))
    }


}

