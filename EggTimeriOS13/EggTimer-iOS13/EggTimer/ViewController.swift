//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var player: AVAudioPlayer?
    
    let eggtimes = ["Soft": 3, "Medium" : 4, "Hard": 7]
    var secondsRemaining = 60
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        secondsPassed = 0
        progressBar.isHidden = false
        progressBar.progress = 0.0;
        
        
        
        
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        
        descriptionLabel.text = "\(hardness) Egg Process is cooking"
        
        
        totalTime = eggtimes[hardness]!
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
      }
    
    @objc func update() {
        
        if(secondsPassed < totalTime) {
            secondsPassed += 1
            let timeProgress = Float(secondsPassed) / Float(totalTime)
                progressBar.progress = timeProgress
            
            }
        else{
            timer.invalidate()
            descriptionLabel.text = "Done!"
            playSound()
            
        }
    }
    
    
        func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
    

}
