//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
@IBAction func hardnessSelected(_ sender: UIButton) {
    
    
    
    timer.invalidate()
        
    let hardness = sender.currentTitle!
    totalTime = eggTimes[hardness]!
    
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
        if self.secondsPassed < self.totalTime {
            
            let percentageProgress = self.secondsPassed / self.totalTime
            
            self.progressBar.progress = Float(percentageProgress)
            
            self.secondsPassed += 1
        } else {
            Timer.invalidate()
            self.titleLabel.text = "DONE!"
        }
    }
            
}
}
