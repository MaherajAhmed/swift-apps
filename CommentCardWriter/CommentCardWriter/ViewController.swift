//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Ahmed, Maheraj (HWTA) on 11/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    @IBOutlet var nameOfSubject: UITextField!
    @IBOutlet var progress: UITextField!
    @IBOutlet var areaOfEnjoyment: UITextField!
    @IBOutlet var challenges: UITextField!
    @IBOutlet var waysToImprove: UITextField!
    @IBOutlet var generateComment: UIButton!
    @IBOutlet var copyToClipboard: UIButton!
    @IBOutlet var commentCardDisplay: UITextView!
    @IBOutlet var subjectPicker: UIPickerView!
    
    let pickerData = ["Maths","English","Chemistry","Biology","Physics","History"]
    let numberOfComponents: Int = pickerData.count
    
                              
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func comment() -> String {
        let nameOfSubject = self.nameOfSubject.text
        let progress = self.progress.text
        let topic = self.areaOfEnjoyment.text
        let challenges = self.challenges.text
        let waysToImprove = self.waysToImprove.text
        
        let data = CommentCardData(name: nameOfSubject!, progress: progress!, topic: topic!, challenges: challenges!, waysToImprove: waysToImprove!)
               
        let generatedComment = CommentCardFactory.generateComment(data: data)
        return generatedComment
    }
    
    @IBAction func generateComment(_ sender: Any) {
        let commentCreate = comment()
        self.commentCardDisplay.text = commentCreate
    }
    
    
    @IBAction func copyToClipboard(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = self.commentCardDisplay.text
    }
    
}

