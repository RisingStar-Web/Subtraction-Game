//
//  TimeViewController.swift
//  Subtraction Game
//
//  Created by Yaroslav Sarnitskiy on 3/16/19.
//  Copyright © 2019 GS Develop Inc. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

var timer = Timer()

class TimeViewController: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var lblTotalCorrect: UILabel!
    
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    @IBOutlet weak var btnAnswer0: UIButton!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    @IBOutlet weak var lblTimeLeft: UILabel!
    
    var firstNumber : Int = 0
    var secondNumber : Int = 0
    var answer : Int = 0
    
    var incorrectAnswer1 : Int = 0
    var incorrectAnswer2 : Int = 0
    var incorrectAnswer3 : Int = 0
    
    var buttonCorrect = 0
    var bestCorrect = 0
    var score = 0
    
    var correctIncorrect : String = ""
    
    var timeLeft = 60
    
    var gameOver = false // if time run out
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayerSecond = AVAudioPlayer()
    var audioPlayerThird = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bestCorrect = UserDefaults.standard.integer(forKey: "bestCorrect")
        
        startCounting()
        
        randomizeTheNumbers()
        
        printButtonText()
        
        printCorrectIncorrect()
        
        lblCorrectIncorrect.text = "Correct / Incorrect"
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
    
    func startCounting(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeViewController.countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown(){
        let tick = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tick", ofType: "mp3")!)
        do {
            audioPlayerSecond = try AVAudioPlayer(contentsOf: tick as URL)
            audioPlayerSecond.prepareToPlay()
        } catch {
            print("Problem in getting File")
        }
        audioPlayerSecond.play()
        
        
        
        timeLeft -= 1
        lblTimeLeft.text = "Time Left: \(timeLeft)"
        
        if timeLeft == 0 {
            timer.invalidate()
            gameOverLogic()
        }
        
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
        timer.invalidate()
        
        timeLeft = 60
        
        score = 0
        
        lblTimeLeft.text = "Time Left\(timeLeft)"
        lblTotalCorrect.text = "Score:\(score)"
        lblCorrectIncorrect.text = "Correct / Incorrect"
        
        resetButton()
        buttonPresedSoundPlay()
        
        randomizeTheNumbers()
        
        gameOver = false
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
                self.view.backgroundColor = UIColor.white
            }, completion: nil)
            
        }, completion: nil)
        
        correctIncorrect = "Incorrect :("
        
        score = score + 1
        bestCorrect = bestCorrect - 1
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
                self.view.backgroundColor = UIColor.white
            }, completion: nil)
            
        }, completion: nil)
        
        score = score + 1
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
        if bestCorrect <= score || bestCorrect <= 0 {
            bestCorrect = score
            UserDefaults.standard.setValue(bestCorrect, forKey: "bestCorrect")
            UserDefaults.standard.synchronize()
        }
    }
    
    func printCorrectIncorrect() {
        bestCorrect = UserDefaults.standard.integer(forKey: "bestCorrect")
        
        lblTotalCorrect.text = "Score: \(score)"
        lblCorrectIncorrect.text = "\(correctIncorrect)"
        reset()
    }
    
    func resetButton(){
        score = 0
        UserDefaults.standard.removeObject(forKey: "bestCorrect")
        
        lblTotalCorrect.text = "Score: \(score)"
        lblCorrectIncorrect.text = "Correct / Incorrect"
        randomizeTheNumbers()
    }
    
    func reset() {
        randomizeTheNumbers()
    }
    
    func gameOverLogic(){
        gameOver = true
        saveBestScore()
        
        let viewControllers: [UIViewController] = navigationController!.viewControllers as [UIViewController]
        navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }
}
