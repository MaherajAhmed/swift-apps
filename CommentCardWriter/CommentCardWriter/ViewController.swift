//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Ahmed, Maheraj (HWTA) on 11/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let data = ["English", "Chemistry", "Biology", "Physics", "History"]
    
    let progressChoices = ["GREAT progress", "good progress", "little progress"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == subjectPicker {
            return data.count
        } else {
            return progressChoices.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == subjectPicker {
            return data[row]
        } else {
            return progressChoices[row]
        }
    }
    
    @IBOutlet var nameOfSubject: UITextField!
    @IBOutlet var progress: UITextField!
    @IBOutlet var areaOfEnjoyment: UITextField!
    @IBOutlet var challenges: UITextField!
    @IBOutlet var waysToImprove: UITextField!
    @IBOutlet var generateComment: UIButton!
    @IBOutlet var copyToClipboard: UIButton!
    @IBOutlet var commentCardDisplay: UITextView!
    @IBOutlet var subjectPicker: UIPickerView!
    @IBOutlet var progressPicker: UIPickerView!
    @IBOutlet var characterCount: UILabel!
    
                              
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        subjectPicker.delegate = self
        subjectPicker.dataSource = self
        progressPicker.delegate = self
        progressPicker.dataSource = self
        let commentCount = comment().count
        characterCount.text = String(commentCount)
    }
    
    func comment() -> String {
        let selectedSubject = subjectPicker.selectedRow(inComponent: 0)
        let nameOfSubject = data[selectedSubject]
        let selectedProgress = progressPicker.selectedRow(inComponent: 0)
        let progress = progressChoices[selectedProgress]
        let topic = self.areaOfEnjoyment.text
        let challenges = self.challenges.text
        let waysToImprove = self.waysToImprove.text
        
        let data = CommentCardData(name: nameOfSubject, progress: progress, topic: topic!, challenges: challenges!, waysToImprove: waysToImprove!)
               
        let generatedComment = CommentCardFactory.generateComment(data: data)
        return generatedComment
    }
    
    @IBAction func generateComment(_ sender: Any) {
        let commentCreate = comment()
        var allComments: [String] = []
        allComments.append(commentCreate)
        print(allComments)
        self.commentCardDisplay.text = commentCreate
    }
    
    
    @IBAction func copyToClipboard(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = self.commentCardDisplay.text
    }
    
}

