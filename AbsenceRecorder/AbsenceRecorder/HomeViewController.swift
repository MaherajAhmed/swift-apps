//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 30/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDummyData()
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        let selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDivision = divisions[indexPath.row]
        
        var absence = Absence(date: currentDate)
        
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            let absence = Absence(date: self.currentDate, present: division.studentsInDiv)
            division.absences.append(absence)
            tableView.reloadData()
            completionHandler(true)
            
            
        }
        allPresent.backgroundColor = UIColor.purple
        return UISwipeActionsConfiguration(actions: [allPresent])
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let cleared = UIContextualAction(style: .normal, title: "Clear All") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            division.absences.removeAll(keepingCapacity: true)
            tableView.reloadData()
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [cleared])
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
    
    func convertDivisionsToJson() -> String? {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(divisions) else {
            print ("Unable to encode divisions into JSON")
            return nil
        }
        
        guard let json = String(data: encoded, encoding:  .utf8) else {
            print("Unable to tur encoded divisions into a string")
            return nil
        }
        
        return json
    }
    
    func convertJsonToDivisions(json: Data) -> [Division]? {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Division].self, from: json) else {
            return nil
        }
        
        return decoded
        
    }
    
    func saveDataToFile() {
        guard let divisionJson = convertDivisionsToJson() else {
            return
        }
        
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            try divisionJson.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print ("Unable to save by writing to a file")
        }
        
    }
    
    func loadDataFromFile() {
        
         let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            let json = try Data(contentsOf: filePath)
            divisions = convertJsonToDivisions(json: json) ?? []
        } catch {
            print ("Failed to read from file")
            loadDummyData()
        }
        
        
    }
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vBY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "HCV-2", of: 9))
        divisions.append(DivisionFactory.createDivision(code: "CX-2", of: 12))
    }


}

