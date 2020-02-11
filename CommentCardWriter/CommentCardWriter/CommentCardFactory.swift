//
//  CommentCardFactory.swift
//  CommentCardWriter
//
//  Created by Ahmed, Maheraj (HWTA) on 11/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

class CommentCardFactory {
    
    static func generateComment(data: CommentCardData ) -> String {
        let comment = "I have made \(data.progress) in \(data.nameOfSubject). I have found \(data.challenges) to be difficult to comprehend and next term I will work even harder to improve by \(data.waysToImprove). I have really enjoyed \(data.areaOfEnjoyment) because I found it to be very interesting and engaging"
        
        return comment
    }
    
}
