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
    }
    
    @IBAction func btnAnswer0ACTION(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAnswer1ACTION(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAnswer2ACTION(_ sender: UIButton) {
        
    }
    
    @IBAction func btbAnswer3ACTION(_ sender: UIButton) {
        
    }
    
}

