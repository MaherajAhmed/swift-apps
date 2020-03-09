//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 06/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class Absence: Codable {
    
    var takenOn : Date
    var present: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
    
    init (date: Date, present: [Student]) {
        takenOn = date
        self.present = present
    }
    
}
