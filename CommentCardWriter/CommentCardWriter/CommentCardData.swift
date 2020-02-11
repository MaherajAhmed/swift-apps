//
//  CommentCardData.swift
//  CommentCardWriter
//
//  Created by Ahmed, Maheraj (HWTA) on 11/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class CommentCardData {
    var nameOfSubject: String
    var progress: String
    var areaOfEnjoyment: String
    var challenges: String
    var waysToImprove: String
       
    init(name: String, progress: String,topic: String, challenges: String, waysToImprove: String) {
        self.nameOfSubject = name
        self.progress = progress
        self.areaOfEnjoyment = topic
        self.challenges = challenges
        self.waysToImprove = waysToImprove
    }
    
}
