//
//  DivisionAbsenceViewController.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 03/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {
    
    var division : Division?
    var currentDate: Date = Date()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateDisplay()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.studentsInDiv.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division?.studentsInDiv[indexPath.row].surname
        
        return cell
    }
    
    func updateDateDisplay () {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        navigationItem.title = formatter.string(from: currentDate)
    }

    

}
