//
//  StartViewController.swift
//  Subtraction Game
//
//  Created by Yaroslav Sarnitskiy on 3/16/19.
//  Copyright © 2019 GS Develop Inc. All rights reserved.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {

    @IBOutlet weak var lblEndlessModeScore: UILabel!
    
    @IBOutlet weak var lblTimeModeBestScore: UILabel!
    
    var audioPlayerSecond = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblEndlessModeScore.text = "Endless Mode Score: \(UserDefaults.standard.integer(forKey: "totalCorrect"))"
        //uncomment when ready
        lblTimeModeBestScore.text = "Time Mode Best Score: \(UserDefaults.standard.integer(forKey: "bestCorrect"))"
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        timer.invalidate()
        
        lblEndlessModeScore.text = "Endless Mode Score: \(UserDefaults.standard.integer(forKey: "totalCorrect"))"
        //uncomment when ready
        lblTimeModeBestScore.text = "Time Mode Best Score: \(UserDefaults.standard.integer(forKey: "bestCorrect"))"
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
    
    @IBAction func endlessModeButtonACTION(_ sender: UIButton) {
        buttonPresedSoundPlay()
    }
    
    @IBAction func timeModeButtonACTION(_ sender: UIButton) {
        buttonPresedSoundPlay()
    }
    

}
