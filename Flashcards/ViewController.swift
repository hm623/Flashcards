//
//  ViewController.swift
//  Flashcards
//
//  Created by Hassan Muhammad on 2/21/20.
//  Copyright © 2020 Hassanudeen Muhammad. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
    
}

class ViewController: UIViewController {
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var cardControl: UIView!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBOutlet weak var prevBtn: UIButton!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardControl.layer.cornerRadius = 20.0
        cardControl.layer.shadowRadius = 15.0
        cardControl.layer.shadowOpacity = 0.2
        
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        frontLabel.clipsToBounds = true
        
        buttonOne.layer.borderWidth = 3.0
        buttonOne.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonOne.layer.cornerRadius = 20.0
        
        
        buttonTwo.layer.borderWidth = 3.0
        buttonTwo.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonTwo.layer.cornerRadius = 20.0
        
        buttonThree.layer.borderWidth = 3.0
        buttonThree.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonThree.layer.cornerRadius = 20.0
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
        updateFlashcard(question: "Who won the World Cup in 2018?", answer: "France", extraAnswerOne: "Brazil", correct: "France", extraAnswerTwo: "Spain")
        } else{
            updateLabels()
            updateNextPrevBtns()
        }
    }
    
    @IBAction func tapNext(_ sender: Any) {
        curr = curr + 1
        
        updateLabels()
        
        updateNextPrevBtns()
    }
    

    @IBAction func tapPrev(_ sender: Any) {
        curr = curr - 1
        
        updateLabels()
        
        updateNextPrevBtns()
    }
    
    
    func saveAllFlashcardstoDisk (){
        
        let dictionaryArray = flashcards.map { (card) -> [String:String] in return ["question": card.question, "answer": card.answer]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults!")
    }
    
    func readSavedFlashcards(){
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            let savedCards = dictionaryArray.map {dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)}
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    
    func updateLabels(){
        let currFlashcards = flashcards[curr]
        
        frontLabel.text = currFlashcards.question
        backLabel.text = currFlashcards.answer
    }
    
    var flashcards = [Flashcard]()
    
    var curr = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let navigationController =  segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        
        if segue.identifier == "EditSegue"{
        creationController.initialQuestion =  frontLabel.text
        creationController.initialAnswer = backLabel.text
        }
    }
    
    
    @IBAction func didTapReveal(_ sender: Any) {
        if frontLabel.isHidden == true{
            
            frontLabel.isHidden = false
        }
        else{
            frontLabel.isHidden = true
        }
        
        if buttonOne.isHidden == true{
            buttonOne.isHidden = false
            
            if buttonThree.isHidden == true
            {
                buttonThree.isHidden = false
            }
        }
        else {
            
            if buttonThree.isHidden == true
            {
                buttonThree.isHidden = false
            }
            
        }
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String, correct: String , extraAnswerTwo: String){
        
        let flashcard = Flashcard(question: question, answer: answer)
    
        /*frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        buttonOne.setTitle(extraAnswerOne, for: .normal)
        buttonTwo.setTitle(correct, for: .normal)
        buttonThree.setTitle(extraAnswerTwo, for: .normal)*/
        
        flashcards.append(flashcard)
        
        curr = flashcards.count - 1
        
        print("Added new flashcard!")
        print("There are \(flashcards.count) flashcards")
        print("We are currently on index \(curr)")
        
        updateNextPrevBtns()
        
        updateLabels()
        
        saveAllFlashcardstoDisk()
        
    }
    
    func updateNextPrevBtns(){
    if curr == flashcards.count - 1
    {
        nextBtn.isEnabled = false
    }else{
        nextBtn.isEnabled = true
        }
        
    if curr == 0
    {
        prevBtn.isEnabled = false
    }else{
        prevBtn.isEnabled = true
        }
    
    }
    
    
    @IBAction func didTapOne(_ sender: Any) {
        buttonOne.isHidden = true
    }
    
    @IBAction func didTapTwo(_ sender: Any) {
        didTapReveal(buttonTwo)
    }
    
    @IBAction func didTapThree(_ sender: Any) {
        buttonThree.isHidden = true
    }
    
    @IBAction func didTapReset(_ sender: Any) {
        
        frontLabel.isHidden = false
       
        if buttonOne.isHidden == true{
            buttonOne.isHidden = false
            
            if buttonThree.isHidden == true
            {
                buttonThree.isHidden = false
            }
        }
        else {
            
            if buttonThree.isHidden == true
            {
                buttonThree.isHidden = false
            }
            
        }
        
    }
    
    
}

