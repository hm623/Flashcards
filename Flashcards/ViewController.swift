//
//  ViewController.swift
//  Flashcards
//
//  Created by Hassan Muhammad on 2/21/20.
//  Copyright © 2020 Hassanudeen Muhammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var cardControl: UIView!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    
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
    
    @IBAction func didTapOne(_ sender: Any) {
        buttonOne.isHidden = true
    }
    
    @IBAction func didTapTwo(_ sender: Any) {
        frontLabel.isHidden = true

    }
    
    @IBAction func didTapThree(_ sender: Any) {
        buttonThree.isHidden = true
    }
    
}

