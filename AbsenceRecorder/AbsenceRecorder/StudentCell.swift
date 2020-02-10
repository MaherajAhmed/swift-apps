//
//  StudentCell.swift
//  AbsenceRecorder
//
//  Created by Ahmed, Maheraj (HWTA) on 06/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.accessoryType = selected ? .checkmark : .none
    }

}
