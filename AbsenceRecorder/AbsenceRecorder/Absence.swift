//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 06/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class Absence {
    
    var takenOn : Date
    var present: [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
}
