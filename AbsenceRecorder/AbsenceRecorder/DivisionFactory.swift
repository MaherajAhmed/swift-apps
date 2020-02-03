//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 30/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        
        for i in 1...size {
            let student = Student(forename: "Firstname\(i)", surname: "Surname\(i)", birthday: Date.init())
            division.studentsInDiv.append(student)
        }
        
        return division
    }
}
