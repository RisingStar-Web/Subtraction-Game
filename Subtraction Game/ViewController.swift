//
//  ViewController.swift
//  Subtraction Game
//
//  Created by Yaroslav Sarnitskiy on 3/14/19.
//  Copyright © 2019 GS Develop Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var lblTotalCorrect: UILabel!
    
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    @IBOutlet weak var btnAnswer0: UIButton!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    var firstNumber : Int = 0
    var secondNumber : Int = 0
    var answer : Int = 0
    
    var buttonCorrect : Int = 0
    
    var incorrectAnswer1 : Int = 0
    var incorrectAnswer2 : Int = 0
    var incorrectAnswer3 : Int = 0
    
    var totalCorrect : Int = 0
    var correctIncorrect : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeTheNumbers()
    }
    
    @IBAction func btnAnswer0ACTION(_ sender: UIButton) {
        if buttonCorrect == 0 {
            button0Correct()
        }else if buttonCorrect != 0 {
            incorrectLogic()
        }
    }
    
    @IBAction func btnAnswer1ACTION(_ sender: UIButton) {
        if buttonCorrect == 1 {
            button1Correct()
        }else if buttonCorrect != 1 {
            incorrectLogic()
        }
    }
    
    @IBAction func btnAnswer2ACTION(_ sender: UIButton) {
        if buttonCorrect == 2 {
            button2Correct()
        }else if buttonCorrect != 2 {
            incorrectLogic()
        }
    }
    
    @IBAction func btbAnswer3ACTION(_ sender: UIButton) {
        if buttonCorrect == 3 {
            button3Correct()
        }else if buttonCorrect != 3 {
            incorrectLogic()
        }
    }
    
    func randomizeTheNumbers() {
        firstNumber = Int(arc4random_uniform(10))
        secondNumber = Int(arc4random_uniform(10))
        
        answer = firstNumber - secondNumber
        
        buttonCorrect = Int(arc4random_uniform(4))
        
        incorrectAnswer1 = Int(arc4random_uniform(5))
        incorrectAnswer2 = Int(arc4random_uniform(4))
        incorrectAnswer3 = Int(arc4random_uniform(20))
        
        randomNumberCheck()
        printButtonText()
        printQuestion()
    }
    
    func printQuestion() {
        lblQuestion.text = "\(firstNumber) - \(secondNumber) = ?"
    }
    
    func randomNumberCheck() {
        if answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 {
            incorrectAnswer1 = Int(arc4random_uniform(5))
            incorrectAnswer2 = Int(arc4random_uniform(4))
            incorrectAnswer3 = Int(arc4random_uniform(20))
            
            if answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 {
                incorrectAnswer1 = 12
                incorrectAnswer2 = 34
                incorrectAnswer3 = 13
            }
        }
    }
    
    func printButtonText() {
        if buttonCorrect == 0 {
            btnAnswer0.setTitle("\(answer)", for: .normal)
            btnAnswer1.setTitle("\(incorrectAnswer1)", for: .normal)
            btnAnswer2.setTitle("\(incorrectAnswer2)", for: .normal)
            btnAnswer3.setTitle("\(incorrectAnswer3)", for: .normal)
        }
        
        if buttonCorrect == 1 {
            btnAnswer1.setTitle("\(answer)", for: .normal)
            btnAnswer0.setTitle("\(incorrectAnswer3)", for: .normal)
            btnAnswer2.setTitle("\(incorrectAnswer2)", for: .normal)
            btnAnswer3.setTitle("\(incorrectAnswer1)", for: .normal)
        }
        
        if buttonCorrect == 2 {
            btnAnswer2.setTitle("\(answer)", for: .normal)
            btnAnswer1.setTitle("\(incorrectAnswer1)", for: .normal)
            btnAnswer0.setTitle("\(incorrectAnswer3)", for: .normal)
            btnAnswer3.setTitle("\(incorrectAnswer2)", for: .normal)
        }
        
        if buttonCorrect == 3 {
            btnAnswer3.setTitle("\(answer)", for: .normal)
            btnAnswer1.setTitle("\(incorrectAnswer3)", for: .normal)
            btnAnswer2.setTitle("\(incorrectAnswer1)", for: .normal)
            btnAnswer0.setTitle("\(incorrectAnswer2)", for: .normal)
        }
    }
    
    func incorrectLogic() {
        correctIncorrect = "Incorrect :("
        printCorrectIncorrect()
    }
    
    func correctLogic() {
        totalCorrect = totalCorrect + 1
        correctIncorrect = "Correct :)"
        printCorrectIncorrect()
    }
    
    func button0Correct() {
        correctLogic()
    }
    
    func button1Correct() {
        correctLogic()
    }
    
    func button2Correct() {
        correctLogic()
    }
    
    func button3Correct() {
        correctLogic()
    }
    
    func printCorrectIncorrect() {
        lblTotalCorrect.text = "Total correct: \(totalCorrect)"
        lblCorrectIncorrect.text = "\(correctIncorrect)"
        reset()
    }
    
    func reset() {
        randomizeTheNumbers()
    }
}

