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
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
@IBAction func hardnessSelected(_ sender: UIButton) {
    
    
    
    timer.invalidate()
        
    let hardness = sender.currentTitle!
    totalTime = eggTimes[hardness]!
    
    progressBar.progress = 0.0
    secondsPassed = 0
    titleLabel.text = hardness
    
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
        if self.secondsPassed < self.totalTime {
            
            self.secondsPassed += 1
            self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
            print(Float(self.secondsPassed) / Float(self.totalTime))
            
            
            
        } else {
            Timer.invalidate()
            self.titleLabel.text = "DONE!"
        }
    }
            
}
    
   
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            

            

        } catch let error {
            print(error.localizedDescription)
            
            player.play()
        }
    }
}

