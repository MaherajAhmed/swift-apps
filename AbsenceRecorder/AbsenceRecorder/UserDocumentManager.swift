//
//  UserDocumentManager.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 09/03/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class UserDocumentManager {
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
