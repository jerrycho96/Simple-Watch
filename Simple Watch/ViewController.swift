//
//  ViewController.swift
//  Simple Watch
//
//  Created by D7703_26 on 2018. 4. 10..
//  Copyright © 2018년 조영진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
        //            self.updateTime()
        //        })
    }
    
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    @IBAction func btStart(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()
            
        })
        
    }
    
    @IBAction func btStop(_ sender: Any) {
        myTimer.invalidate()
    }
    
    @IBAction func btReset(_ sender: Any) {
        count = 0
        
        timeLabel.text! = "00:00:00"
    }
}

