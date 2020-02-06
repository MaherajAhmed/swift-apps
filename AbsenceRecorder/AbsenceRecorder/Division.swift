//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 30/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class Division {
    let code: String
    var studentsInDiv: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
        
    func getAbsence(for date: Date) -> Absence? {
        return absences.first { $0.takenOn == date }
    }
}
