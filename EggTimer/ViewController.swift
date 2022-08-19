//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 360,"Medium" :480,"Hard" : 720]
    @IBOutlet weak var textLabe: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPressed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPressed = 0
        textLabe.text = hardness
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        @objc func updateCounter(){
            if secondsPressed < totalTime {
                secondsPressed += 1
            let percentageProgress = Float (secondsPressed)/Float (totalTime)
                
                progressBar.progress = Float(percentageProgress)
            
            
            
                    }
            else{
                
                textLabe.text = "Done"
                playSound()
            }
                }
    
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    
    
        
    }

    
    
    
    

