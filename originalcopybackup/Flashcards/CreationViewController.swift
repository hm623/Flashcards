//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Hassan Muhammad on 2/23/20.
//  Copyright © 2020 Hassanudeen Muhammad. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    var initialQuestion: String?
    
    var initialAnswer: String?
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var extraAnswer1: UITextField!
    
    @IBOutlet weak var answer: UITextField!
    
    @IBOutlet weak var extraAnswer2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        
        
        let questionText = questionTextField.text

        let answerText = answerTextField.text
        
        let extra1 = extraAnswer1.text
        
        let extra2 = extraAnswer2.text
        
        let correctChoice = answer.text
    
        
        let alert = UIAlertController(title: "Missing text!", message: "All text field must be filled", preferredStyle: UIAlertController.Style .alert)
        
        let okAction = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(okAction)
        
        
            
        flashcardsController.frontLabel.isHidden = false
        
        if flashcardsController.buttonOne.isHidden == true{
            flashcardsController.buttonOne.isHidden = false
            
            if flashcardsController.buttonThree.isHidden == true
            {
                flashcardsController.buttonThree.isHidden = false
            }
        }
        else {
            
            if flashcardsController.buttonThree.isHidden == true
            {
                flashcardsController.buttonThree.isHidden = false
            }
            
        }
        
        
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty || extra1 == nil || extra2 == nil || extra1!.isEmpty || extra2!.isEmpty || correctChoice == nil || correctChoice!.isEmpty {
            
            present (alert, animated: true)
            
        } else {
            
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: extra1!, correct: correctChoice! ,extraAnswerTwo: extra2!)
        
        dismiss(animated: true)
            
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
