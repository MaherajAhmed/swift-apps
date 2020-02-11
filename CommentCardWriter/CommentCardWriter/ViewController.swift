//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Ahmed, Maheraj (HWTA) on 11/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameOfSubject: UITextField!
    @IBOutlet var progress: UITextField!
    @IBOutlet var areaOfEnjoyment: UITextField!
    @IBOutlet var challenges: UITextField!
    @IBOutlet var waysToImprove: UITextField!
    @IBOutlet var commentCardDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generateComment(_ sender: Any) {
        if let nameOfSubject = self.nameOfSubject.text {
            if nameOfSubject == "" {
            }
        }
        if let progress = self.progress.text {
            if progress == "" {
                
            }
        }
        let topic = self.areaOfEnjoyment.text
        let challenges = self.challenges.text
        let waysToImprove = self.waysToImprove.text
        
        let data = CommentCardData(name: nameOfSubject, progress: progress, topic: topic, challenges: challenges, waysToImprove: waysToImprove)
        
        CommentCardFactory.generateComment(data: data)
        
    
    }
}

