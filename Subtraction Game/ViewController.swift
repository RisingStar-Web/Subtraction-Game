//
//  ViewController.swift
//  Subtraction Game
//
//  Created by Yaroslav Sarnitskiy on 3/14/19.
//  Copyright © 2019 GS Develop Inc. All rights reserved.
//

import UIKit
import AVFoundation
func hexStringToUIColor(_ hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
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
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayerSecond = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeTheNumbers()
        
        printButtonText()
        
        printCorrectIncorrect()
        
    }
    
    func buttonPresedSoundPlay() {
        let click = NSURL(fileURLWithPath: Bundle.main.path(forResource: "click", ofType: "mp3")!)
        do {
            audioPlayerSecond = try AVAudioPlayer(contentsOf: click as URL)
            audioPlayerSecond.prepareToPlay()
        } catch {
            print("Problem in getting File")
        }
        audioPlayerSecond.play()
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
    @IBAction func resetButtonACTION(_ sender: UIButton) {
        resetButton()
        buttonPresedSoundPlay()
    }
    
    func randomizeTheNumbers() {
        
        firstNumber = Int(arc4random_uniform(20))
        secondNumber = Int(arc4random_uniform(20))
        
        if firstNumber < secondNumber {
            firstNumber = Int(arc4random_uniform(20))
            secondNumber = Int(arc4random_uniform(20))
            
            if firstNumber < secondNumber {
                firstNumber = Int(arc4random_uniform(20))
                secondNumber = Int(arc4random_uniform(20))
                
                if firstNumber < secondNumber {
                    firstNumber = 10
                    secondNumber = 3
                }
            }
        }
        
        answer = firstNumber - secondNumber
        
        buttonCorrect = Int(arc4random_uniform(4))
        
        incorrectAnswer1 = Int(arc4random_uniform(20))
        incorrectAnswer2 = Int(arc4random_uniform(20))
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
            incorrectAnswer1 = Int(arc4random_uniform(20))
            incorrectAnswer2 = Int(arc4random_uniform(20))
            incorrectAnswer3 = Int(arc4random_uniform(20))
            
            if answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 {
                incorrectAnswer1 = Int(arc4random_uniform(20))
                incorrectAnswer2 = Int(arc4random_uniform(20))
                incorrectAnswer3 = Int(arc4random_uniform(20))
                
                if answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 {
                    incorrectAnswer1 = Int(arc4random_uniform(20))
                    incorrectAnswer2 = Int(arc4random_uniform(20))
                    incorrectAnswer3 = Int(arc4random_uniform(20))
                    
                    if answer == incorrectAnswer1 || answer == incorrectAnswer2 || answer == incorrectAnswer3 {
                        incorrectAnswer1 = 40
                        incorrectAnswer2 = -1
                        incorrectAnswer3 = 45
                    }
                }
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
        // play lose sound
        let loseSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "lose", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: loseSound as URL)
            audioPlayer.prepareToPlay()
        } catch {
            print("Problem in getting File")
        }
        audioPlayer.play()
        
        // Wrong answer logic
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        UIView.animate(withDuration: 0.8, animations: {
            self.view.backgroundColor = UIColor.red
            
            UIView.animate(withDuration: 0.8, animations: {
                self.view.backgroundColor = hexStringToUIColor("#d99b3b")
            }, completion: nil)
            
        }, completion: nil)
        
        correctIncorrect = "Incorrect :("
        
        totalCorrect = totalCorrect - 1
        saveBestScore()
        
        printCorrectIncorrect()
    }
    
    func correctLogic() {
        // win sound
        let winSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "win", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: winSound as URL)
            audioPlayer.prepareToPlay()
        } catch {
            print("Problem in getting File")
        }
        audioPlayer.play()
        
        // other staff
        UIView.animate(withDuration: 0.8, animations: {
            self.view.backgroundColor = UIColor.green
            
            UIView.animate(withDuration: 0.8, animations: {
                self.view.backgroundColor = hexStringToUIColor("#d99b3b")
            }, completion: nil)
            
        }, completion: nil)
        
        totalCorrect = totalCorrect + 1
        saveBestScore()
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
    
    func saveBestScore(){
        if totalCorrect >= 0 {
            UserDefaults.standard.setValue(totalCorrect, forKey: "totalCorrect")
            UserDefaults.standard.synchronize()
        }
    }
    
    func printCorrectIncorrect() {
        totalCorrect = UserDefaults.standard.integer(forKey: "totalCorrect")
        
        lblTotalCorrect.text = "Total correct: \(totalCorrect)"
        lblCorrectIncorrect.text = "\(correctIncorrect)"
        reset()
    }
    
    func resetButton(){
        totalCorrect = 0
        UserDefaults.standard.removeObject(forKey: "totalCorrect")
        
        lblTotalCorrect.text = "Total Correct:: \(totalCorrect)"
        lblCorrectIncorrect.text = "Correct / Incorrect"
        randomizeTheNumbers()
    }
    
    func reset() {
        randomizeTheNumbers()
    }
}

